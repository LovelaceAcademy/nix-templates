{pkgs, ...}: {
  # name = "project-name";
  
  # GHC upgrade policy:
  #  We use the latest supported and cached version
  #  from github:input-output-hk/haskell.nix
  # TODO ghc99 does not build with HSL
  # TODO ghc98 does not build with HSL
  compiler-nix-name = "ghc96";

  # Enable for cross-platform build
  # crossPlatforms = p: pkgs.lib.optionals pkgs.stdenv.hostPlatform.isx86_64 ([
  #   p.mingwW64
  #   p.ghcjs
  # ] ++ pkgs.lib.optionals pkgs.stdenv.hostPlatform.isLinux [
  #   p.musl64
  # ]);

  # Tools to include in the development shell
  shell.tools.cabal = "latest";
  shell.tools.haskell-language-server = "latest";
  # The language server already includes a formatter
  # shell.tools.hlint = "latest";
}
