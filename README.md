# nix-templates

[![Test](https://github.com/LovelaceAcademy/nix-templates/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/LovelaceAcademy/nix-templates/actions/workflows/test.yml?query=branch%3Amain)

Minimal reproducible nix flake templates

## Usage

```bash
nix flake init -t github:LovelaceAcademy/nix-templates#template-name
```

### Templates

- [haskell-nix](./haskell-nix): A haskell.nix template using hix
- [plutus](./plutus): A plutus template using haskell.nix
- [ctl](./ctl): A cardano-transaction-lib template using purs-nix

## FAQ

### Why the templates have `flake.lock` files?

While I agree that storing lock files in templates is not ideal, there is no way to be sure the template is working if we do not store lock files. It's a trade-off, we prefer to have working templates than up-to-date dependencies. That said, we try to keep all templates here in sync with upstream / dependencies as far as possible.

### Will you support other systems?

It depends on upstream supporting it, and also our capacity to test in our CI. Right now only these systems are supported:

- x86_64-linux (all templates)
- aarch64-linux (haskell-nix and plutus)

### Minimal system requirements?

It depends on the template:

- haskell-nix: you'll need at least 8GB RAM and 10GB HDD
- plutus: you'll need at least 16GB RAM (for HDD) or 12GB RAM (for SSD). At least 20GB of available space.

### Why it take soo long to build?

- You should hit IOG/our cache (given that you have allowed nix to). [Check here for more info](https://input-output-hk.github.io/haskell.nix/troubleshooting.html).
- You should expect to download at least 10GB of data (from the caches)
- If you hardware is constrained it will take more time building, using a SSD will potentially speed-up things. **Remember to close everything in the first build to not be OOM killed**.

### I am getting `No such file or directory`

This is a know issue (NixOS/nix#6642). Be sure to initialize a git repo before (`git init`).
