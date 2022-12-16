{
  description = "Nix flake templates";

  outputs = { self }: {
    templates = {
      haskell-nix = {
        path = ./haskell-nix;
        description = "A haskell.nix template using hix";
        welcomeText = ''
          You just created an haskell.nix template using hix. Read more about it here:
          https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-flakes.html
        '';
      };

      plutus = {
        path = ./plutus;
        description = "A plutus template using haskell.nix";
        welcomeText = ''
          You just created an haskell.nix template using hix. Read more about it here:
          https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-flakes.html
        '';
      };
    };
  };
}
