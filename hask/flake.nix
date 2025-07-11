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
    accept-flake-config = true;
    extra-experimental-features = "nix-command flakes";
  };
}
