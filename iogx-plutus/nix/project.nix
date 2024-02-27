{ repoRoot, inputs, pkgs, lib, ... }:
let
  # TODO move iogx-plutus project name to module args
  name = "iogx-plutus";
in
lib.iogx.mkHaskellProject {
  combinedHaddock = {
    enable = true;
    packages = [
      name
      # add cabal packages here
      "cardano-api"
      "plutus-core"
      "plutus-ledger-api"
      "plutus-tx"
      "plutus-tx-plugin"
    ];
  };
  cabalProject = pkgs.haskell-nix.cabalProject'
    {
      inherit name;
      src = ../.;
      # `compiler-nix-name` upgrade policy:
      #  as soon input-output-hk/haskell-nix has cached it
      # TODO ghc98 not available on iogx
      # TODO ghc96 not compatible with cardano-api constraint
      compiler-nix-name = lib.mkDefault "ghc92";
      inputMap = {
        "https://input-output-hk.github.io/cardano-haskell-packages" = inputs.iogx.inputs.CHaP;
      };
    };
  shellArgs = _: {
    name = "${name}-shell";
    scripts.docs = {
      group = "general";
      description = "Open haddock documentation.";
      exec = "npx http-server ${repoRoot.nix.project.combined-haddock}/share/doc -o";
    };
  };
}
