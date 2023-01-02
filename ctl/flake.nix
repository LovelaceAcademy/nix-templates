{
  inputs = {
    ctl.url = "github:LovelaceAcademy/ctl-nix";
    nixpkgs.follows = "ctl/nixpkgs";
    purs-nix.url = "github:purs-nix/purs-nix";
    utils.url = "github:ursi/flake-utils";
  };

  outputs = { self, utils, ... }@inputs:
    # TODO remove systems limited by LovelaceAcademy/purescript-affjax
    let systems = [ "x86_64-linux" ]; in
    utils.apply-systems
      { inherit inputs; inherit systems; }
      ({ pkgs, system, ... }:
        let
          ctl = inputs.ctl { inherit system; };
          purs-nix = inputs.purs-nix {
            inherit system;
            overlays = [ ctl ];
          };
          ps = purs-nix.purs
            {
              # Project dir (src, test)
              dir = ./.;
              # Dependencies
              dependencies =
                with purs-nix.ps-pkgs;
                [
                  #cardano-transaction-lib
                  affjax
                  bigints
                  #toppokki
                  #medea
                  #mote
                  #lattice 
                  #properties 
                  #sequences 
                  #aeson-helpers
                  #aeson
                  either
                ];
              # FFI dependencies
              # foreign.Main.node_modules = [];
            };
        in
        {
          packages.default = ps.modules.Main.output { };
        });
}
