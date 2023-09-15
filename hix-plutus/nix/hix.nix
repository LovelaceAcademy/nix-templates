{pkgs, ...}: {
  # name = "project-name";
  
  # We use the latest supported and cached version
  # from github:input-output-hk/haskell.nix
  # TODO bump plutus GHC
  compiler-nix-name = "ghc8107";

  # Enable for cross-platform build
  # crossPlatforms = p: pkgs.lib.optionals pkgs.stdenv.hostPlatform.isx86_64 ([
  #   p.mingwW64
  #   p.ghcjs
  # ] ++ pkgs.lib.optionals pkgs.stdenv.hostPlatform.isLinux [
  #   p.musl64
  # ]);

  # Tools to include in the development shell
  shell.tools.cabal = "latest";
  # FIXME find out the hlint version for hix
  # shell.tools.hlint = "latest";
  # haskell-language-server should follow GHC
  shell.tools.haskell-language-server = "2.0.0.0";
}
