{
  inputs.horizon-platform.url = "git+https://gitlab.homotopic.tech/horizon/horizon-platform";
  inputs.nixpkgs.follows = "horizon-platform/nixpkgs";
  inputs.utils.url = "github:ursi/flake-utils";

  outputs = { self, utils, ... }@inputs:
    utils.apply-systems
      {
        inherit inputs;
        # TODO support additional systems on hor
        #  horizon-platform is only supporting linux
        systems = [ "x86_64-linux" ];
      }
      ({ pkgs, system, ... }:
        let
          hsPkgs =
            with pkgs.haskell.lib;
            inputs.horizon-platform.legacyPackages.${system}.extend (hfinal: hprev:
              {
                hor = disableLibraryProfiling (hprev.callCabal2nix "hor" ./. { });
              });
        in
        # Flake definition must follow hor.cabal
        {
          packages.default = hsPkgs.hor;
          devShells.default = hsPkgs.hor.env.overrideAttrs (attrs: {
            buildInputs = with pkgs; attrs.buildInputs ++ [
              cabal-install
            ];
          });
          checks.output = pkgs.runCommand "hor-output" { }
            ''
              echo ${hsPkgs.hor} > $out
            '';
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
      "https://hercules-ci.cachix.org"
    ];
    extra-trusted-public-keys = [
      "klarkc.cachix.org-1:R+z+m4Cq0hMgfZ7AQ42WRpGuHJumLLx3k0XhwpNFq9U="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hercules-ci.cachix.org-1:ZZeDl9Va+xe9j+KqdzoBZMFJHVQ42Uu/c/1/KMC5Lw0="
    ];
    allow-import-from-derivation = "true";
  };
}
