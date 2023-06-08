{
  description = "Nix flake templates";

  outputs = { self }:
    let
      welcome = { project, tool, link, target ? "" }: ''
        You just created a ${project} project using ${tool}. Read more about it here:
        ${link}

        Development shell available on `nix develop`
        Build the project with `nix build ${target}`
        Run the project with `nix run ${target}`
      '';
      hixWelcomeText = welcome {
        project = "Haskell";
        tool = "haskell.nix (hix)";
        link = "https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-flakes.html";
        target = ".#hello:exe:hello`";
      };
      pixWelcomeText = welcome {
        project = "PureScript";
        tool = "purs-nix (pix)";
        link = "https://github.com/purs-nix/purs-nix";
      };
      ctlWelcomeText = welcome {
        project = "cardano-transaction-lib";
        tool = "purs-nix (pix)";
        link = "https://github.com/Plutonomicon/cardano-transaction-lib";
      };
      horWelcomeText = welcome {
        project = "Haskell";
        tool = "horizon-platform";
        link = "https://gitlab.homotopic.tech/horizon/horizon-platform";
      };
    in
    {
      templates = {
        hix = {
          path = ./hix;
          description = "A haskell.nix template using hix";
          welcomeText = hixWelcomeText;
        };

        hix-plutus = {
          path = ./hix-plutus;
          description = "A plutus template using hix";
          welcomeText = ''
            ${hixWelcomeText}
            Plutus docs available with `nix run .#serve-docs`
          '';
        };
        hor = {
          path = ./hor;
          description = "A haskell template using horizon-platform";
          welcomeText = horWelcomeText;
        };
        hor-plutus = {
          path = ./hor-plutus;
          description = "A plutus template using horizon-platform";
          welcomeText = horWelcomeText;
        };
        pix = {
          path = ./pix;
          description = "A purs-nix template";
          welcomeText = pixWelcomeText;
        };
        pix-ctl = {
          path = ./pix-ctl;
          description = "A minimal cardano-transaction-lib template using pix";
          welcomeText = ctlWelcomeText;
        };
        pix-ctl-full = {
          path = ./pix-ctl-full;
          description = "A optioned cardano-transaction-lib template using pix and webpack";
          welcomeText = ctlWelcomeText;
        };
        pix-purenix = {
          path = ./pix-purenix;
          description = "A minimal purenix template using pix";
          welcomeText = pixWelcomeText;
        };
      };
    };
}
