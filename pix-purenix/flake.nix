{
  inputs = {
    purenix-pkgs.url = "github:klarkc/purenix-packages";
    nixpkgs.follows = "purenix-pkgs/nixpkgs";
    purs-nix.follows = "purenix-pkgs/purs-nix";
    utils.url = "github:ursi/flake-utils";
    # optional
    # ps-tools.follows = "purs-nix/ps-tools";
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
          purs-nix = inputs.purs-nix {
            inherit system;
            overlays = [ purenix-pkgs ];
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
                  arrays
                ];
            };
          ps-command = ps.command { };
        in
        {
          packages.default = ps.output { };

          devShells.default =
            pkgs.mkShell
              {
                packages =
                  with pkgs;
                  [
                    ps-command
                    # optional devShell tools
                    # ps-tools.for-0_15.purescript-language-server
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
      "https://hercules-ci.cachix.org"
    ];
    extra-trusted-public-keys = [
      "klarkc.cachix.org-1:R+z+m4Cq0hMgfZ7AQ42WRpGuHJumLLx3k0XhwpNFq9U="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hercules-ci.cachix.org-1:ZZeDl9Va+xe9j+KqdzoBZMFJHVQ42Uu/c/1/KMC5Lw0="
    ];
  };
}
