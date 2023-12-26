{ repoRoot, pkgs, lib, ... }:
let
  # TODO move iogx project name to module args
  name = "iogx";
in
lib.iogx.mkHaskellProject {
  cabalProject = pkgs.haskell-nix.cabalProject'
    {
      inherit name;
      src = ../.;
      # `compiler-nix-name` upgrade policy:
      #  as soon input-output-hk/haskell-nix has cached it
      # TODO ghc98 not available on iogx
      compiler-nix-name = lib.mkDefault "ghc96";
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
