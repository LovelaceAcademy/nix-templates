# nix-templates

[![Test](https://github.com/LovelaceAcademy/nix-templates/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/LovelaceAcademy/nix-templates/actions/workflows/test.yml?query=branch%3Amain)

Minimal reproducible nix flake templates

## Usage

```bash
nix flake init -t github:LovelaceAcademy/nix-templates#template-name
```

### Templates

- [hix](./hix): A haskell.nix (hix) template
- [hix-plutus](./hix-plutus): A plutus template using haskell.nix
- [hor](./hor): A haskell template using horizon-platform
- [hor-plutus](./hor-plutus): A plutus template using horizon-platform
- [pix](./pix): A PureScript purs-nix template
- [pix-ctl](./pix-ctl): A minimal cardano-transaction-lib template using pix
- [pix-ctl-full](./pix-ctl-full): A optioned cardano-transaction-lib template using pix

## FAQ

### Why the templates have `flake.lock` files?

While I agree that storing lock files in templates is not ideal, there is no way to be sure the template is working if we do not store lock files. It's a trade-off, we prefer to have working templates than up-to-date dependencies. That said, we try to keep all templates here in sync with upstream / dependencies as far as possible.

### Will you support other systems?

It depends on upstream supporting it, and also our capacity to test in our CI. Right now only these systems are supported:

- x86_64-linux (all templates)
- aarch64-linux (hix and hix-*)

### Minimal system requirements?

It depends on the template:

- hix, hor, pix: you'll need at least 8GB RAM and 10GB HDD
- hix-plutus, pix-ctl: you'll need at least 16GB RAM (for HDD) or 12GB RAM (for SSD). At least 20GB of available space.

### Why it take soo long to build?

- You can use prebuilt binaries if you accept flake cache settings, to do that you need to be a [trusted-user](https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-trusted-users).
- Haskell.nix (hix) is known for having slow evaluation/build times, you might try horizon-platform (hor) for a faster alternative.
- If you hardware is constrained it will take more time building, using a SSD will potentially speed-up things. **Remember to close everything in the first build to not be OOM killed**.

### I am getting `No such file or directory`

This is a know issue (NixOS/nix#6642). Be sure to initialize a git repo before (`git init`).
