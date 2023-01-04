{
  inputs = {
    ctl-nix.url = "github:LovelaceAcademy/ctl-nix";
    nixpkgs.follows = "ctl-nix/nixpkgs";
    purs-nix.url = "github:purs-nix/purs-nix";
    utils.url = "github:ursi/flake-utils";
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
              # foreign.Main.node_modules = [];
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
                    easy-ps.purescript-language-server
                    purs
                    ps-command
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
