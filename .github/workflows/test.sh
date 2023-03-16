#!/bin/bash
SYSTEM=$1
TMPL=$2
PWD=$(pwd)
DIR=/tmp/nix-templates
IFD_DIR=${DIR}/ifd
SOURCE_DIR="${DIR}/source"
TARGET_DIR=${DIR}/target

# clean up any previous data
set +ex
rm -Rf $DIR
set -ex

check () {
	nix flake check --show-trace --print-build-logs --verbose
}

git_init() {
	git init
}

# wrap nix flake to fix IFD
# see NixOS/nix#4265
# see input-output-hg/haskell.nix#1711
ifd_check () {
	# we use a ifd-generated flake that filter the systems
	# to avoid the linked IFD issue
	cat <<EOF	>> flake.nix
{
	inputs = {
		nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
		target.url = path:$TARGET_DIR;
		utils.url = github:ursi/flake-utils;
	};


	outputs = { utils, target, ... }@inputs:
		utils.apply-systems
			{
				inherit inputs;
				systems = [ "${SYSTEM}" ];
			}
      ({ pkgs, system, ... }:
        let
          b = builtins;
          l = pkgs.lib;
          flakeFields = [ "apps" "checks" "devShell" "devShells" "hydraJobs" "legacyPackages" "packages" "formatter" "overlays" ];
        in
        l.lists.foldl
          (res: attrName:
            if l.attrsets.hasAttrByPath [ attrName system ] target then res // {
              \${attrName} = target.\${attrName}.\${system};
            } else res)
          { }
          (l.lists.intersectLists flakeFields (b.attrNames target))
      );


	# TODO import nixConfig from nix flakes
  nixConfig = {
    # This sets the flake to use nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [
      "https://klarkc.cachix.org?priority=99"
      "https://cache.iog.io"
      "https://cache.zw3rk.com"
      "https://cache.nixos.org"
    ];
    extra-trusted-public-keys = [
      "klarkc.cachix.org-1:R+z+m4Cq0hMgfZ7AQ42WRpGuHJumLLx3k0XhwpNFq9U="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    allow-import-from-derivation = "true";
  };
}
EOF
	git_init
	git add flake.nix
	git diff --staged
	nix flake lock --verbose
	git diff
	check
}

if [ "$TMPL" = "" ]; then
	# test the project
	check
else
	mkdir -p $DIR
	# prepare the source
	cp -r $PWD $SOURCE_DIR
	# any changes before the test must happen now
	(
		cd ${SOURCE_DIR}/${TMPL}
		sed -i 's|\(.*\)github:LovelaceAcademy/nix-templates?dir=\(.*\)|\1path:../\2|g' flake.nix
		nix flake lock
	)
	# prepare the target
	(
		mkdir -p $TARGET_DIR
		cd $TARGET_DIR
		git_init
		nix flake init -t "${SOURCE_DIR}#${TMPL}"
	)
	# test the target
	# TODO Remove ifd_check workaround from test
	(
		mkdir $IFD_DIR
		cd $IFD_DIR
		ifd_check
	)
fi
