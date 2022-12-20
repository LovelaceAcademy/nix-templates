{
  description = "Nix flake templates";

  outputs = { self }:
    let generalWelcomeText = ''
      You just created an haskell.nix template using hix. Read more about it here:
      https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-flakes.html
      Build and run the project with `nix run .#hello:exe:hello`
      Development shell available on `nix develop`
    ''; in
    {
      templates = {
        haskell-nix = {
          path = ./haskell-nix;
          description = "A haskell.nix template using hix";
          welcomeText = generalWelcomeText;
        };

        plutus = {
          path = ./plutus;
          description = "A plutus template using haskell.nix";
          welcomeText = ''
            ${generalWelcomeText}
            Plutus docs available with `nix run .#serve-docs`
          '';
        };
      };
    };
}
