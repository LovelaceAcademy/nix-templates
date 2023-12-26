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
      haskWelcomeText = welcome {
        project = "Haskell";
        tool = "hask";
        link = "https://nixos.org/manual/nixpkgs/stable/#haskell";
      };
      iogxWelcomeText = welcome {
        project = "Haskell";
        tool = "haskell.nix (iogx)";
        link = "https://github.com/input-output-hk/iogx";
        target = ".#iogx:exe:iogx`";
      };
      hixWelcomeText = welcome {
        project = "Haskell";
        tool = "haskell.nix (hix)";
        link = "https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-flakes.html";
        target = ".#hello:exe:hello`";
      };
      ctlWelcomeText = welcome {
        project = "cardano-transaction-lib";
        tool = "purs-nix (pix)";
        link = "https://github.com/Plutonomicon/cardano-transaction-lib";
      };
    in
    {
      templates = {
        hask = {
          path = ./hask;
          description = "A minimal haskell template";
          welcomeText = haskWelcomeText;
        };

        iogx = {
          path = ./iogx;
          description = "A haskell.nix template using iogx";
          welcomeText = iogxWelcomeText;
        };

        hix-plutus = {
          path = ./hix-plutus;
          description = "A plutus template using hix";
          welcomeText = ''
            ${hixWelcomeText}
            Plutus docs available with `nix run .#serve-docs`
          '';
        };
        pix = {
          path = ./pix;
          description = "A purs-nix template";
          welcomeText = ''
            You just created a purs-nix project.
            Read more about it here: https://github.com/purs-nix/purs-nix

            Development shell with `nix develop`
            Build with `nix build`
          '';
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
      };
    };
}
