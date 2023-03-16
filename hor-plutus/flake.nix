{
  inputs.horizon-wave-ocean.url = "git+https://gitlab.homotopic.tech/horizon/wave-ocean/horizon-wave-ocean-platform";
  inputs.nixpkgs.follows = "horizon-wave-ocean/nixpkgs";
  inputs.utils.url = "github:ursi/flake-utils";

  outputs = { self, utils, ... }@inputs:
    utils.apply-systems
      {
        inherit inputs;
        # TODO support additional systems on hor
        #  horizon-platform is only supporting linux
        systems = [ "x86_64-linux" ];
        make-pkgs = system:
          let
            pkgs = import inputs.nixpkgs { inherit system; };
            hPkgs = inputs.horizon-wave-ocean.legacyPackages.${system};
          in
          pkgs.extend (f: p: hPkgs // {
            hello = p.haskell.lib.disableLibraryProfiling (
              f.callCabal2nix "hello" ./. { }
            );
          });
      }
      ({ pkgs, ... }:
        # Flake definition must follow hello.cabal
        {
          packages.default = pkgs.hello;
          devShell = pkgs.hello.env.overrideAttrs (attrs: {
            buildInputs = with pkgs; attrs.buildInputs ++ [
              cabal-install
            ];
          });
        });

  # --- Flake Local Nix Configuration ----------------------------
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
  };
}
