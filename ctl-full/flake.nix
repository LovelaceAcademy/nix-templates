{
  inputs = {
    ctl-nix.url = "github:LovelaceAcademy/ctl-nix";
    nixpkgs.follows = "ctl-nix/nixpkgs";
    purs-nix.follows = "ctl-nix/purs-nix";
    utils.url = "github:ursi/flake-utils";
    npmlock2nix.url = "github:nix-community/npmlock2nix";
    npmlock2nix.flake = false;
  };

  outputs = { self, utils, ... }@inputs:
    let
      # TODO add missing arm to match standard systems
      #  right now purs-nix is only compatible with x86_64-linux
      systems = [ "x86_64-linux" ];
      overlays = with inputs.ctl-nix.inputs.ctl.overlays; [
        # needed by CTL
        purescript
      ];
    in
    utils.apply-systems
      { inherit inputs systems overlays; }
      ({ system, pkgs, ctl-nix, ... }:
        let
          # Use purs from CTL instead from nixpkgs
          purs = pkgs.easy-ps.purs-0_14_5;
          purs-nix = inputs.purs-nix {
            inherit system;
            overlays = [ ctl-nix ];
          };
          npmlock2nix = import inputs.npmlock2nix { inherit pkgs; };
          node_modules = npmlock2nix.v1.node_modules { src = ./.; } + /node_modules;
          ps = purs-nix.purs
            {
              purescript = purs;
              # Project dir (src, test)
              dir = ./.;
              # Dependencies
              dependencies =
                with purs-nix.ps-pkgs;
                [
                  cardano-transaction-lib
                ];
              # FFI dependencies
              # TODO Affjax FFI should be in ctl-nix
              foreign.Affjax.node_modules = node_modules;
            };
          ps-output = ps.output { };
          ps-command = ps.command { };
          purs-watch = pkgs.writeShellApplication {
            name = "purs-watch";
            runtimeInputs = with pkgs; [ entr ps-command ];
            text = "find src | entr -s 'echo building && purs-nix compile'";
          };
          # TODO move ctl-full from vite to esbuild
          #  depends on Plutonomicon/cardano-transaction-lib#1414
          vite = pkgs.writeShellApplication {
            name = "vite";
            runtimeInputs = with pkgs; [ nodejs ];
            text = ''npx vite --config vite.config.js --open "$@"'';
          };
          dev = pkgs.writeShellApplication {
            name = "dev";
            runtimeInputs = with pkgs; [ concurrently ];
            text = "concurrently purs-watch vite";
          };
        in
        {
          packages.default = ps-output;

          devShells.default =
            pkgs.mkShell
              {
                packages =
                  with pkgs;
                  [
                    easy-ps.purescript-language-server
                    purs
                    ps-command
                    nodejs
                    purs-watch
                    vite
                    dev
                  ];
              };
        });

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    # This sets the flake to use nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [
      "https://cache.nixos.org"
      "https://cache.iog.io"
      "https://klarkc.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "klarkc.cachix.org-1:R+z+m4Cq0hMgfZ7AQ42WRpGuHJumLLx3k0XhwpNFq9U="
    ];
    allow-import-from-derivation = "true";
  };
}
