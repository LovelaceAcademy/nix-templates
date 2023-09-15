{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.utils.url = "github:ursi/flake-utils";

  outputs = { self, utils, ... }@inputs:
    utils.apply-systems { inherit inputs; }
      ({ pkgs, system, ... }:
        let
          hask = pkgs.haskellPackages.developPackage {
            root = ./.;
          };
        in
        # Flake definition must follow haskell.cabal
        {
          packages.default = hask;
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              cabal-install
              haskell-language-server
              hlint
            ];
            inputsFrom = [
              hask.env
            ];
          };
          checks.output = pkgs.runCommand "project-output" { }
            ''
              echo ${hask} > $out
            '';
        });

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    # This sets the flake to use nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [
      "https://klarkc.cachix.org?priority=99"
    ];
    extra-trusted-public-keys = [
      "klarkc.cachix.org-1:R+z+m4Cq0hMgfZ7AQ42WRpGuHJumLLx3k0XhwpNFq9U="
    ];
  };
}
