{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.utils.url = "github:ursi/flake-utils";

  outputs = { self, utils, ... }@inputs:
    utils.apply-systems { inherit inputs; }
      ({ pkgs, system, ... }:
        let
          agda = pkgs.agda.withPackages (ps: with ps; [
            # shared dependencies (should mirror ./agd.agd-lib)
            standard-library
            agda-prelude
          ]);
          agd = pkgs.agdaPackages.mkDerivation {
            pname = "agd";
            version = "0.1";
            src = ./src;
            buildInputs = [ agda ];
            postBuild = ''
              agda -c Main.agda
            '';
            postInstall = ''
              mkdir -p $out/bin
              cp Main $out/bin/agd
            '';
            meta = { };
          };
        in
        # Flake definition must follow haskell.cabal
        {
          packages.default = agd;
          devShells.default = pkgs.mkShell {
            # FIXME enable agda-language-server
            #packages = with pkgs; [
            #  haskellPackages.agda-language-server
            #];
            buildInputs = [
              agda
            ];
            shellHook = ''
              alias log_='printf "\033[1;32m%s\033[0m\n" "$@"'
              alias info_='printf "\033[1;34m[INFO] %s\033[0m\n" "$@"'
              alias warn_='printf "\033[1;33m[WARN] %s\033[0m\n" "$@"'
              log_ "Welcome to agd shell."
              info_ "Available commands: agda."
              warn_ "agda needs to be called in src folder"
            '';
          };
          checks.output = pkgs.runCommand "agd-output" { }
            ''
              echo ${agd} > $out
            '';
        });

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    # This sets the flake to use nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [
      "https://cache.tcp4.me?priority=99"
    ];
    extra-trusted-public-keys = [
      "cache.tcp4.me:cmk2Iz81lQuX7FtTUcBgtqgI70E8p6SOamNAIcFDSew="
    ];
  };
}
