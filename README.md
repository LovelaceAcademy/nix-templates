# nix-templates

[![Test](https://github.com/LovelaceAcademy/nix-templates/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/LovelaceAcademy/nix-templates/actions/workflows/test.yml?query=branch%3Amain)

Minimal reproducible nix flake templates

## Usage

```bash
nix flake init -t github:LovelaceAcademy/nix-templates#template-name
```

### Templates

- [haskell-nix](./haskell-nix)
- [plutus](./plutus)

## FAQ

### Why the templates have `flake.lock` files?

While I agree that storing lock files in templates is not ideal, there is no way to be sure the template is working if we do not store lock files. It's a trade-off, we prefer to have working templates than up-to-date dependencies. That said, we try to keep all templates here in sync with upstream / dependencies as far as possible.
