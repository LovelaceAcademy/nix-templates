{
  # This is a template created by `hix init`
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix";
  inputs.nixpkgs.follows = "haskellNix/nixpkgs-unstable";
  inputs.utils.url = "github:ursi/flake-utils";
  outputs = { self, utils, haskellNix, ... }@inputs:
    utils.apply-systems
      {
        inherit inputs;
        overlays = [ haskellNix.overlay ];
      }
      ({ pkgs, system, ... }:
        let
          hixProject = haskell-nix.hix.project {
            src = ./.;
            evalSystem = "x86_64-linux";
          };
          flake = hixProject.flake { };
        in
        # Flake definition follows hello.cabal
        flake // {
          legacyPackages = pkgs;
        });

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    # This sets the flake to use the IOG nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [ "https://cache.iog.io" ];
    extra-trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    allow-import-from-derivation = "true";
  };
}
