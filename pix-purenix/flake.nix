{
  inputs = {
    purenix-pkgs.url = "github:klarkc/purenix-packages/add-registry";
    nixpkgs.follows = "purenix-pkgs/nixpkgs";
    purs-nix.follows = "purenix-pkgs/purs-nix";
    #ps-tools.follows = "purenix-pkgs/ps-tools";
    purenix.url = "github:purenix-org/purenix";
    utils.url = "github:ursi/flake-utils";
  };

  outputs = { self, utils, ... }@inputs:
    let
      # TODO add missing arm to match standard systems
      #  right now purs-nix is only compatible with x86_64-linux
      systems = [ "x86_64-linux" ];
    in
    utils.apply-systems
      { inherit inputs systems; }
      ({ system, pkgs, purenix-pkgs, ... }:
        let
          compile = { codegen = "corefn"; };
          purs-nix = inputs.purs-nix {
            inherit system;
            defaults = { inherit compile; };
            overlays = [ purenix-pkgs.overlay ];
          };
          ps = purs-nix.purs
            {
              # Project dir (src, test)
              dir = ./.;
              # Dependencies
              dependencies =
                with purs-nix.ps-pkgs;
                [
                  prelude
                ];
              # use compatible compiler
              inherit (purenix-pkgs) purescript;
            };
          prefix = "output";
          purenix-output = pkgs.stdenv.mkDerivation
            {
              inherit prefix;
              name = "purenix-output";
              src = ps.output { };
              nativeBuildInputs = with pkgs; [ purenix tree ];
              dontInstall = true;
              postBuild = ''
                mkdir -p $out
                cp -L -r $src $out/${prefix}
                chmod -R u+w $out/${prefix}
                cd $out
                purenix
              '';
            };
        in
        {
          packages.default = purenix-output;

          devShells.default =
            pkgs.mkShell
              {
                packages =
                  with pkgs;
                  [
                    (ps.command { inherit compile; })
                    # optional devShell tools
                    # ps-tools.for-0_15.purescript-language-server
                    # ps-tools.for-0_15.purty
                    # purs-nix.esbuild
                    # purs-nix.purescript
                    # nodejs
                  ];
              };
        });

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    # This sets the flake to use nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [
      "https://klarkc.cachix.org?priority=99"
      "https://cache.nixos.org"
    ];
    extra-trusted-public-keys = [
      "klarkc.cachix.org-1:R+z+m4Cq0hMgfZ7AQ42WRpGuHJumLLx3k0XhwpNFq9U="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
}
