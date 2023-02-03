{
  description = "Nix flake templates";

  outputs = { self }:
    let
      hsWelcomeText = ''
        You just created an haskell.nix template using hix. Read more about it here:
        https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-flakes.html

        Development shell available on `nix develop`
        Build and run the project with `nix run .#hello:exe:hello`
      '';
      ctlWelcomeText = ''
        You just created an cardano-transaction-lib project.
        Read more about it here: https://github.com/Plutonomicon/cardano-transaction-lib

        Development shell with `nix develop`
        Build with `nix build`
      '';
    in
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
        purs-nix = {
          path = ./purs-nix;
          description = "A purs-nix template";
          welcomeText = ''
            You just created a purs-nix project.
            Read more about it here: https://github.com/purs-nix/purs-nix

            Development shell with `nix develop`
            Build with `nix build`
          '';
        };
        ctl = {
          path = ./ctl;
          description = "A minimal cardano-transaction-lib template using purs-nix";
          welcomeText = ctlWelcomeText;
        };
        ctl-full = {
          path = ./ctl-full;
          description = "A optioned cardano-transaction-lib template using purs-nix and webpack";
          welcomeText = ctlWelcomeText;
        };
      };
    };
}
