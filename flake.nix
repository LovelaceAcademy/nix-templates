{
  description = "Nix flake templates";

  outputs = { self }:
    let hsWelcomeText = ''
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
          welcomeText = hsWelcomeText;
        };

        plutus = {
          path = ./plutus;
          description = "A plutus template using haskell.nix";
          welcomeText = ''
            ${hsWelcomeText}
            Plutus docs available with `nix run .#serve-docs`
          '';
        };
        ctl = {
          path = ./ctl;
          description = "A cardano-transaction-lib template using purs-nix";
          welcomeText = "Build and run the project with `nix run`";
        };
      };
    };
}
