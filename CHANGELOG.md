# Changelog

## [9.0.1](https://github.com/LovelaceAcademy/nix-templates/compare/v9.0.0...v9.0.1) (2024-05-10)


### Bug Fixes

* **pix-ctl|pix-ctl-full:** fix missing cache branch ([738e768](https://github.com/LovelaceAcademy/nix-templates/commit/738e768f8772a74ffc19909cf14e9aa69deb7366))

## [9.0.0](https://github.com/LovelaceAcademy/nix-templates/compare/v8.0.0...v9.0.0) (2024-05-10)


### ⚠ BREAKING CHANGES

* **hask:** drop support for darwin

### Features

* **agd:** add minimal template ([60ad952](https://github.com/LovelaceAcademy/nix-templates/commit/60ad952e18f038030d703111a9aa12a6253a1be8))
* **agd:** drop support for darwin ([623339f](https://github.com/LovelaceAcademy/nix-templates/commit/623339f848d07991e64f9ee2d418d7a1f7631d19))
* **hask:** drop support for darwin ([91ffb7e](https://github.com/LovelaceAcademy/nix-templates/commit/91ffb7e35f37d376c70d300018a6fc1b35b94afe))

## [8.0.0](https://github.com/LovelaceAcademy/nix-templates/compare/v7.0.0...v8.0.0) (2024-01-04)


### ⚠ BREAKING CHANGES

* **hix-plutus:** hix-plutus removed, we using the new iogx template for haskell.nix
* **hix:** hix removed, we using the new iogx template for haskell.nix
* **hor|hor-plutus:** hor and hor-plutus removed

### Features

* change cache server ([fcd9dba](https://github.com/LovelaceAcademy/nix-templates/commit/fcd9dba1b744daf93e1cbbaae756c8ad0ca37aaf))
* **hix-plutus:** move from hix-plutus to iogx-plutus ([05f69fa](https://github.com/LovelaceAcademy/nix-templates/commit/05f69fadfbbdb74f08c7a237c7afecf1bc572f33))
* **hix:** bump GHC ([8337d49](https://github.com/LovelaceAcademy/nix-templates/commit/8337d49ada534e998dc3951cfffd4503eb3935f5))
* **hix:** move from hix to iogx ([1422913](https://github.com/LovelaceAcademy/nix-templates/commit/1422913b7092def1c1a8793627dc862d76729488))
* **hor|hor-plutus:** remove horizon templates ([8e43510](https://github.com/LovelaceAcademy/nix-templates/commit/8e435106ee451b819189b85c737d9a0106ae1154))

## [7.0.0](https://github.com/LovelaceAcademy/nix-templates/compare/v6.1.1...v7.0.0) (2023-12-19)


### ⚠ BREAKING CHANGES

* **pix-ctl:** see ctl-nix upstream for breaking changes
* **pix-ctl-full:** see ctl-nix upstream for breaking changes

### Features

* **pix-ctl-full:** upgrade CTL to purs 0.15 ([9e9735b](https://github.com/LovelaceAcademy/nix-templates/commit/9e9735be1df642e10f8b7b9897c83c80e2b2e88d))
* **pix-ctl:** upgrade CTL to v7.0 ([7ef265f](https://github.com/LovelaceAcademy/nix-templates/commit/7ef265f385e3232b7be7fffe389ed086328dd926))


### Bug Fixes

* **pix-ctl-full:** add missing repl gitignore ([685eed9](https://github.com/LovelaceAcademy/nix-templates/commit/685eed9a9f6c17a2201d64f48a042a09b5d3cbbf))
* **pix-ctl-full:** add runtime by fixing arion version ([f186401](https://github.com/LovelaceAcademy/nix-templates/commit/f186401b625a6e624a122726ec187e4f7ffc2d85))
* **pix-ctl-full:** breaking change on BigInt ([2451551](https://github.com/LovelaceAcademy/nix-templates/commit/245155134c5f3d362da01b3be9420c36902b2603))
* **pix-ctl-full:** readd cardano-cli ([aec6562](https://github.com/LovelaceAcademy/nix-templates/commit/aec6562d03110ad25570c0adfa10e6e03df6fd5a))
* **pix-ctl-full:** readd dev and bundle cmds ([1da131e](https://github.com/LovelaceAcademy/nix-templates/commit/1da131e5236b3088755c38bb725f4e0e083e9078))

## [6.1.1](https://github.com/LovelaceAcademy/nix-templates/compare/v6.1.0...v6.1.1) (2023-10-09)


### Bug Fixes

* **pix-ctl/pix-ctl-full:** bump purs to 0.14.7 and fix different version ([d2e90d2](https://github.com/LovelaceAcademy/nix-templates/commit/d2e90d284e8eb49ec930def86a923d8dd1d66749))

## [6.1.0](https://github.com/LovelaceAcademy/nix-templates/compare/v6.0.0...v6.1.0) (2023-10-05)


### Features

* **hix-plutus:** update to new iohk-nix overlays ([4fb46d3](https://github.com/LovelaceAcademy/nix-templates/commit/4fb46d388baaf69fb0c91e7cb7b922ad8ea5e232))

## [6.0.0](https://github.com/LovelaceAcademy/nix-templates/compare/v5.0.0...v6.0.0) (2023-09-27)


### ⚠ BREAKING CHANGES

* **hix/hix-plutus:** x86_64-darwin not supported anymore

### Features

* **hask:** add hlint and lsp ([e482a42](https://github.com/LovelaceAcademy/nix-templates/commit/e482a425bbf62d3e70a1ff4743d9104ef808822f))
* **hix-plutus:** add LSP ([5e61bc7](https://github.com/LovelaceAcademy/nix-templates/commit/5e61bc78d2edf0f3227fe07eb62363aeaad0ef26))
* **hix/hix-plutus:** drop support for broken systems ([072e276](https://github.com/LovelaceAcademy/nix-templates/commit/072e276b20d792ba8167a7f38f9862d6f67d879f))
* **hix:** add evalSystem for running system ([469b797](https://github.com/LovelaceAcademy/nix-templates/commit/469b79723fb3fe8549277f18e4851a5dd529b75a))
* **hix:** add missing LSP ([4a2fc04](https://github.com/LovelaceAcademy/nix-templates/commit/4a2fc0472c4d38c4add6366995d1831bc3c206e7))
* **hix:** enable lsp and lint ([e9828c3](https://github.com/LovelaceAcademy/nix-templates/commit/e9828c369d6f0862015c80a0536ccf54acc331fa))
* **hor-plutus:** add dev tools ([3d25d16](https://github.com/LovelaceAcademy/nix-templates/commit/3d25d165000e30c82bb553768f0733884bed9940))
* **hor-plutus:** use latest cabal-install ([7a4973d](https://github.com/LovelaceAcademy/nix-templates/commit/7a4973de977c9e491d70a065f5e98cd38c2c04b9))
* **hor,hor-plutus:** add hor proper cache ([41a4525](https://github.com/LovelaceAcademy/nix-templates/commit/41a45256d65f42c1ec2a6e4ee649ab2a5585996a))
* **hor:** enable hor dev tools ([c5aba6f](https://github.com/LovelaceAcademy/nix-templates/commit/c5aba6fe68a307b34e21f6a74e1b8b850f22d334))
* **hor:** use latest cabal-install ([712e3a6](https://github.com/LovelaceAcademy/nix-templates/commit/712e3a6b73792d3a96338ce8f70b5c8c9efa507d))
* **pix-ctl,pix-ctl-full:** remove redudant cache ([1043c6e](https://github.com/LovelaceAcademy/nix-templates/commit/1043c6e7c2833ba727c38590e9a4264eba6e61fd))


### Bug Fixes

* **hask:** cabal dist not being ignored ([5cd90cf](https://github.com/LovelaceAcademy/nix-templates/commit/5cd90cf2213c29a28c68f63900b02e8b5bc3826f))
* **hix,hix-plutus:** lsp broken ([8750a6e](https://github.com/LovelaceAcademy/nix-templates/commit/8750a6e4bafa6f9a1b64088a8327b59d33600e0c))
* **hix:** disable broken LSP and lint build ([ba34c83](https://github.com/LovelaceAcademy/nix-templates/commit/ba34c837dcd23b47470e6de22da06a0b9ac5c272))
* **hix:** not producing expected system ([06458aa](https://github.com/LovelaceAcademy/nix-templates/commit/06458aa56cd203ebcd8d29bf56b568d370f20a6d))
* **hor-plutus:** disable LSP not building ([bca2332](https://github.com/LovelaceAcademy/nix-templates/commit/bca23321a84fa5811ee9328d98d21552cf88e9a8))
* **hor-plutus:** fix cabal files gitignore ([c859569](https://github.com/LovelaceAcademy/nix-templates/commit/c859569c37c7dadabca4a1f5f08e516a9a7f07f1))


### Performance Improvements

* **hix-plutus:** remove unused cache ([4a9c76d](https://github.com/LovelaceAcademy/nix-templates/commit/4a9c76dcdf93fa4498b6a555337d553483780fed))
* **hix:** remove unused cache ([e8af120](https://github.com/LovelaceAcademy/nix-templates/commit/e8af1207b3ea2c8400405c9d95d9463c6f9f0f09))
* **hor,hor-plutus:** remove unused cache ([84b1518](https://github.com/LovelaceAcademy/nix-templates/commit/84b1518c781999247fcdb096cb150a60589efbea))
* **pix:** remove unused cache ([5ef3767](https://github.com/LovelaceAcademy/nix-templates/commit/5ef3767d5fbf0e8df1f0bc2a5565f4b1bf68dc5f))

## [5.0.0](https://github.com/LovelaceAcademy/nix-templates/compare/v4.2.1...v5.0.0) (2023-06-24)


### ⚠ BREAKING CHANGES

* **test:** remove aarch64-linux for all templates

### Features

* **hask:** add minimal template ([3e94feb](https://github.com/LovelaceAcademy/nix-templates/commit/3e94feb8fe548f022c075c2e6512f45e787453d4))


### Bug Fixes

* hask name, supported systems ([a356d2a](https://github.com/LovelaceAcademy/nix-templates/commit/a356d2a0c84338aef08eab827e0dce23788cde02))


### Continuous Integration

* **test:** rework test matrix ([e09102a](https://github.com/LovelaceAcademy/nix-templates/commit/e09102af209dccb2ccfe77e8b21161c861e9a29b))

## [4.2.1](https://github.com/LovelaceAcademy/nix-templates/compare/v4.2.0...v4.2.1) (2023-06-12)


### Bug Fixes

* add experimental flake command config ([b42de1a](https://github.com/LovelaceAcademy/nix-templates/commit/b42de1a9f38895cce7aa85b0690c8a86260b6e94))

## [4.2.0](https://github.com/LovelaceAcademy/nix-templates/compare/v4.1.1...v4.2.0) (2023-04-26)


### Features

* **hor-plutus:** add optional HSL ([f85798d](https://github.com/LovelaceAcademy/nix-templates/commit/f85798d1f6191a85a1e19e3825855382a5773366))
* **hor-plutus:** add serve-docs ([0294d2f](https://github.com/LovelaceAcademy/nix-templates/commit/0294d2f59bc09f1a21c1203b44e9fb3ac0970e02))

## [4.1.1](https://github.com/LovelaceAcademy/nix-templates/compare/v4.1.0...v4.1.1) (2023-04-10)


### Performance Improvements

* **pix-ctl-full:** improve webpack watch rebuild config ([8681be1](https://github.com/LovelaceAcademy/nix-templates/commit/8681be1108f3797c8c2fc9d3ccdee3267867d699))

## [4.1.0](https://github.com/LovelaceAcademy/nix-templates/compare/v4.0.0...v4.1.0) (2023-03-27)


### Features

* add herculis ci cache ([34c58a5](https://github.com/LovelaceAcademy/nix-templates/commit/34c58a54366f7055eddcf7aba7926a74304c9895))


### Performance Improvements

* **pix-ctl-full:** improve build times by not including testRuntime in devShell ([56851ac](https://github.com/LovelaceAcademy/nix-templates/commit/56851ac9b7e6f210e76307a3872b7d8272185fea))

## [4.0.0](https://github.com/LovelaceAcademy/nix-templates/compare/v3.0.0...v4.0.0) (2023-03-16)


### ⚠ BREAKING CHANGES

* **pix-ctl-full:** rename pkg and modules
* **hor-plutus:** rename pkg and modules
* **hor:** rename pkg and modules
* **pix:** rename modules
* **hix-plutus:** rename pkg and modules
* **hix:** rename pkg and modules
* haskell-nix renamed to hix, plutus renamed to hix-plutus, purs-nix renamed to pix, ctl renamed to pix-ctl, ctl-full renamed to pix-ctl-full

### Features

* add hor template ([bfa82be](https://github.com/LovelaceAcademy/nix-templates/commit/bfa82be1cb60accc052c702cd2adaf7f134a2644))
* **ctl-full:** add scripts ([0a873a6](https://github.com/LovelaceAcademy/nix-templates/commit/0a873a69053f23f58408baa6a4322893f255d6bb))
* **hix-plutus:** rename pkg and modules ([a3445f4](https://github.com/LovelaceAcademy/nix-templates/commit/a3445f4a604f7df6a2e79c4485dd670b53489397))
* **hix:** rename pkg and modules ([96bc4f4](https://github.com/LovelaceAcademy/nix-templates/commit/96bc4f4c4995e48c4a2f4230609c3d2a43f6abf5))
* **hor-plutus:** add flake ([5eac2b5](https://github.com/LovelaceAcademy/nix-templates/commit/5eac2b5a2bdf805d55b46d647f70bf09ae13d7ff))
* **hor-plutus:** add script output ([bdef644](https://github.com/LovelaceAcademy/nix-templates/commit/bdef644fed9adaa1db13c9566ca3dbb66dcb4c57))
* **hor-plutus:** add script output as package ([589ccb0](https://github.com/LovelaceAcademy/nix-templates/commit/589ccb0ae953cf98ed626476aa6607fe044af41c))
* **hor-plutus:** copy from hor ([96f27ba](https://github.com/LovelaceAcademy/nix-templates/commit/96f27bae50fde9d1bfab99b0b2df29fbf16d7c9c))
* **hor-plutus:** import from hix-plutus ([8144604](https://github.com/LovelaceAcademy/nix-templates/commit/814460470074c4126a2049a30e72795f34a6d0ca))
* **hor-plutus:** rename pkg and modules ([e0aea63](https://github.com/LovelaceAcademy/nix-templates/commit/e0aea63eb5b35b9ec991501b6389d308ef0f193d))
* **hor:** add minimal template ([ae4ea3d](https://github.com/LovelaceAcademy/nix-templates/commit/ae4ea3da3327fc94299ce40611b0644f80523352))
* **hor:** rename pkg and modules ([ef89590](https://github.com/LovelaceAcademy/nix-templates/commit/ef895902b51e9133a7a9e2dc33ebc1e7bad72167))
* **pix-ctl-full:** change contract to hor-plutus ([5a4502e](https://github.com/LovelaceAcademy/nix-templates/commit/5a4502ede6d258bf27d47cb1857a438689175574))
* **pix-ctl-full:** rename pkg and modules ([abcca02](https://github.com/LovelaceAcademy/nix-templates/commit/abcca028e1b58bdf2b1dec987aaf394b00a5784a))
* **pix:** rename modules ([eb47252](https://github.com/LovelaceAcademy/nix-templates/commit/eb4725272c67e08ea05c9d3163a6bc709eae56fe))
* rename all templates to a new naming std ([fd01ab9](https://github.com/LovelaceAcademy/nix-templates/commit/fd01ab900a1804226146d2855c5080c37f258240))


### Bug Fixes

* add missing IFD on hor ([3ab3ca3](https://github.com/LovelaceAcademy/nix-templates/commit/3ab3ca3f28a2eb4697c991919b1bcf3c0a969775))
* **ctl-full:** incorrect contract url ([723f6f6](https://github.com/LovelaceAcademy/nix-templates/commit/723f6f6005e539d8e702058e0d0bfb7313c2a255))
* **hor-plutus:** fix checks not working ([1b4138f](https://github.com/LovelaceAcademy/nix-templates/commit/1b4138fea05d5294b025b989011668c77a8ebb5b))
* **hor-plutus:** script output ([590d561](https://github.com/LovelaceAcademy/nix-templates/commit/590d561723fda58c1b95a8224e0b586c463c2def))
* **hor-plutus:** unsupported cabal-version ([9b7123f](https://github.com/LovelaceAcademy/nix-templates/commit/9b7123f53dfcb0db81d3d25b86cbe6b2a7f5f363))
* **hor:** checks not working ([d61d63b](https://github.com/LovelaceAcademy/nix-templates/commit/d61d63bb7b9c7ccb05a876777e40b0491482d03a))
* **hor:** unsupported cabal-version ([6b5a559](https://github.com/LovelaceAcademy/nix-templates/commit/6b5a55968d3affc82c28058924278c6ae5ca8c40))
* **pix-ctl-full:** fix example ([45728e1](https://github.com/LovelaceAcademy/nix-templates/commit/45728e13ac6e105400587be8a1d3e4eebf46a8e8))


### Performance Improvements

* **hor:** remove useless file ([19196ce](https://github.com/LovelaceAcademy/nix-templates/commit/19196ce0257993120354a99419741e251ce5e899))

## [3.0.0](https://github.com/LovelaceAcademy/nix-templates/compare/v2.1.0...v3.0.0) (2023-03-14)


### ⚠ BREAKING CHANGES

* **ctl-full:** ogmius-datum-cache and postgres removed from runtime (see LovelaceAcademy/ctl-nix for more info)
* **ctl:** ogmius-datum-cache and postgres removed from runtime (see LovelaceAcademy/ctl-nix for more info)

### Bug Fixes

* remove broken iohk cache ([172daf6](https://github.com/LovelaceAcademy/nix-templates/commit/172daf6692264cf91d9e77c3100df6cdca382982))
* remove broken plutonomicon cache ([10e3f2b](https://github.com/LovelaceAcademy/nix-templates/commit/10e3f2b882d848c5762936ef307b74a4e0789da5))


### Build System

* **ctl-full:** Bump ctl-nix ([a9930a8](https://github.com/LovelaceAcademy/nix-templates/commit/a9930a8a5280b167c02aba22b675510046089ebc))
* **ctl:** Bump ctl-nix ([d4bf383](https://github.com/LovelaceAcademy/nix-templates/commit/d4bf3835329f51be2a2bd53906de5873664a15de))

## [2.1.0](https://github.com/LovelaceAcademy/nix-templates/compare/v2.0.1...v2.1.0) (2023-03-04)


### Features

* **ctl-full:** add an option to speedup dev runtime ([be3bd23](https://github.com/LovelaceAcademy/nix-templates/commit/be3bd2333d8dfe09c125643d638b710378953ceb))
* **ctl-full:** add watch tests ([2c97c62](https://github.com/LovelaceAcademy/nix-templates/commit/2c97c62f65e938c7563a39a96e65499f5de3708f))
* **ctl:** change from nami to eternl given nami is not signing txs ([be555c4](https://github.com/LovelaceAcademy/nix-templates/commit/be555c450d83307d90036f7e8e332a72dcfc9714))


### Bug Fixes

* **ctl-full:** check not working ([8816ade](https://github.com/LovelaceAcademy/nix-templates/commit/8816aded092033df20ebba877d7f151902d3a8e9))

## [2.0.1](https://github.com/LovelaceAcademy/nix-templates/compare/v2.0.0...v2.0.1) (2023-02-25)


### Bug Fixes

* **ctl-full:** missing node_modules on purs-nix compile ([b7b1968](https://github.com/LovelaceAcademy/nix-templates/commit/b7b19687f291e2931ab0294143fc518e19ce24b8))
* **ctl-full:** tests not running in checks ([3d8865d](https://github.com/LovelaceAcademy/nix-templates/commit/3d8865d6a523827b6ba2316e2b649b0c52eb7c50))
* remove not working cache ([7b89330](https://github.com/LovelaceAcademy/nix-templates/commit/7b89330001def3465a69d12c800e8b845efe215f))

## [2.0.0](https://github.com/LovelaceAcademy/nix-templates/compare/v1.5.2...v2.0.0) (2023-02-18)


### ⚠ BREAKING CHANGES

* **ctl-full:** webpack and serve removed

### Features

* add additional community caches ([3dcccd6](https://github.com/LovelaceAcademy/nix-templates/commit/3dcccd6522ac6510393c79f64a60a656eceb7142))
* **ctl-full:** add tests with plutip ([4613273](https://github.com/LovelaceAcademy/nix-templates/commit/46132736929cdbb3c45c3da4360cc12e5af94e05))
* **ctl-full:** reorganize ctl-full commands ([2158f27](https://github.com/LovelaceAcademy/nix-templates/commit/2158f270d30196c5881ef8af1fe4ba1a78579484))
* **plutus:** add a minimal typed plutus example, add plutus-apps ([cd127ce](https://github.com/LovelaceAcademy/nix-templates/commit/cd127ce371a3a733c66666a0d1868676ad0d9950))
* update nix cache to fix [#55](https://github.com/LovelaceAcademy/nix-templates/issues/55) ([1a46995](https://github.com/LovelaceAcademy/nix-templates/commit/1a46995ecd9b52b8fe1ed58ab8dc2df0f2346260))


### Bug Fixes

* **ctl-full:** remove unused import ([adf226f](https://github.com/LovelaceAcademy/nix-templates/commit/adf226fb83addbf7d3f57eefa447ec49678d6981))
* **ctl-full:** remove unused test deps ([58a01e9](https://github.com/LovelaceAcademy/nix-templates/commit/58a01e984de8772b780da443d0e555fd43014119))

## [1.5.2](https://github.com/LovelaceAcademy/nix-templates/compare/v1.5.1...v1.5.2) (2023-02-07)


### Bug Fixes

* **ctl-full:** nix does not have NODE_PATH ([25c2c49](https://github.com/LovelaceAcademy/nix-templates/commit/25c2c4952d083b7fbd5c63f339ddf2198be766c6))
* **ctl-full:** update webpack for ctl v4.0.2 ([fa309e1](https://github.com/LovelaceAcademy/nix-templates/commit/fa309e1340ccac68fad916bdf1ef8168300b7c1c))

## [1.5.1](https://github.com/LovelaceAcademy/nix-templates/compare/v1.5.0...v1.5.1) (2023-02-04)


### Bug Fixes

* **ctl-full:** cardano-cli incorrect volume ([f9a7411](https://github.com/LovelaceAcademy/nix-templates/commit/f9a7411852849660670a42dc4b825c6c9501c926))

## [1.5.0](https://github.com/LovelaceAcademy/nix-templates/compare/v1.4.0...v1.5.0) (2023-02-03)


### Features

* **ctl-full:** add ctl-full from ctl ([4f096d9](https://github.com/LovelaceAcademy/nix-templates/commit/4f096d9b849bdba12022f4aa65f075adc237eccf))
* **ctl-full:** add docs ([62a5179](https://github.com/LovelaceAcademy/nix-templates/commit/62a5179abf171d91bc66d8d85b53bdc5872d6990))
* **ctl-full:** add runtime and cardano-cli ([2ca8298](https://github.com/LovelaceAcademy/nix-templates/commit/2ca82983a0ee5c5304ca85c9c7df0bcc3cfe7658))
* **ctl-full:** add webpack, purs-nix, serve, dev, bundle ([64f6fbe](https://github.com/LovelaceAcademy/nix-templates/commit/64f6fbec1429af27157029f767f7c30ff11f9aed))


### Bug Fixes

* **ctl-full:** add missing Affjax FFI ([eddf4ff](https://github.com/LovelaceAcademy/nix-templates/commit/eddf4ff46565522d738defe092aeb0f6ab29217d))
* incorrect ctl-full description ([c02fd32](https://github.com/LovelaceAcademy/nix-templates/commit/c02fd324b5dd20554ad1c5a9e8f182d1cb176fd2))

## [1.4.0](https://github.com/LovelaceAcademy/nix-templates/compare/v1.3.0...v1.4.0) (2023-01-31)


### Features

* **ctl:** bump deps and purs-nix now follows ctl-nix ([5880743](https://github.com/LovelaceAcademy/nix-templates/commit/5880743fd284cf2a1f07502be0bff842b47ca485))

## [1.3.0](https://github.com/LovelaceAcademy/nix-templates/compare/v1.2.0...v1.3.0) (2023-01-10)


### Features

* **purs-nix:** add minimal template ([45ac8b5](https://github.com/LovelaceAcademy/nix-templates/commit/45ac8b5fb16125ee2b6f23ebce5ce54205e6c9c9))

## [1.2.0](https://github.com/LovelaceAcademy/nix-templates/compare/v1.1.0...v1.2.0) (2023-01-05)


### Features

* **ctl:** lock inputs ([ae86fd6](https://github.com/LovelaceAcademy/nix-templates/commit/ae86fd6817df2b0e7470d5210d233af03fba2832))
* **ctl:** update template with ctl-nix changes ([37cd079](https://github.com/LovelaceAcademy/nix-templates/commit/37cd079792c876054d87e79b51bb831fde7ac96f))
* import ctl from ctl-nix ([a7626fc](https://github.com/LovelaceAcademy/nix-templates/commit/a7626fc31949d1a12e752fd2aee51bdd1e15180f))


### Bug Fixes

* add missing ctl on template lists ([0e0dd25](https://github.com/LovelaceAcademy/nix-templates/commit/0e0dd25665f8ab640e81aab1714bd36493b17eb7))

## [1.1.0](https://github.com/LovelaceAcademy/nix-templates/compare/v1.0.0...v1.1.0) (2022-12-21)


### Features

* add usage introductions in intro message ([c40d671](https://github.com/LovelaceAcademy/nix-templates/commit/c40d67198cf0d1611234087454f8f6c3e019009f))
* **haskell-nix:** bump GHC ([#5](https://github.com/LovelaceAcademy/nix-templates/issues/5)) ([fb1488b](https://github.com/LovelaceAcademy/nix-templates/commit/fb1488b57b0b306fd8807db8ffb7a837c66fa8d1))
* limit systems support ([0878f3c](https://github.com/LovelaceAcademy/nix-templates/commit/0878f3cbb313bb3ccde488191dd7f817e679e4c7))
* **plutus:** add from haskell-nix ([e9f693f](https://github.com/LovelaceAcademy/nix-templates/commit/e9f693f67c89a05a5a092861a38d78ca8a542ab8))
* **plutus:** add minimal validator ([ad7d78f](https://github.com/LovelaceAcademy/nix-templates/commit/ad7d78f40e7bd4c1c30ee5bbec1d8295ce4aa3b1))
* **plutus:** add minimum contract stdout ([5de9ebe](https://github.com/LovelaceAcademy/nix-templates/commit/5de9ebe11999affca24dcd15c9aead6bb939ee9d))
* **plutus:** add serve-docs ([065e794](https://github.com/LovelaceAcademy/nix-templates/commit/065e794e8211e508359fb23685a3a295e8bc811c))
* **plutus:** bump GHC ([4df2ad3](https://github.com/LovelaceAcademy/nix-templates/commit/4df2ad320e096c1bbfa96770665adf106e3b6f65))
* **plutus:** remove plutus-apps to fix nix develop ([a6a1ead](https://github.com/LovelaceAcademy/nix-templates/commit/a6a1ead38f7dac058e4ce6ffa867ef81d80a2b1c))
* rename haskellNix to haskell-nix on inputs ([7cf6ae7](https://github.com/LovelaceAcademy/nix-templates/commit/7cf6ae72c853a2fadbf53f2b1c2d26f097df4e2f))


### Bug Fixes

* **plutus:** check failing with incompatible systems ([fdb8e8b](https://github.com/LovelaceAcademy/nix-templates/commit/fdb8e8bcbecae5f7f2886daff8dff40a4d81eb08))

## 1.0.0 (2022-12-16)


### Features

* **haskell-nix:** add a lock file with iog cached versions ([811419c](https://github.com/LovelaceAcademy/nix-templates/commit/811419c7a1f6b65253c7b6cf10da11a2df52644b))
* **haskell-nix:** add lock file ([88d82a0](https://github.com/LovelaceAcademy/nix-templates/commit/88d82a053b55beb44635784a5034c42005334122))
* **haskell-nix:** add minimal template ([0b2bd66](https://github.com/LovelaceAcademy/nix-templates/commit/0b2bd665a75999a9fc7a9159b34cbe2c69161baa))
* **haskell-nix:** add two more caches ([eeb0d50](https://github.com/LovelaceAcademy/nix-templates/commit/eeb0d5084eb22b354f1ec552451487708453c10f))
* **haskell-nix:** reduce to bare minimum ([b1ab4a6](https://github.com/LovelaceAcademy/nix-templates/commit/b1ab4a62031dd547330679ccb3a4b121a57bbc7e))


### Bug Fixes

* **haskell-nix:** cabal error ([64e9b1f](https://github.com/LovelaceAcademy/nix-templates/commit/64e9b1f66bcc351cef228150e9b25aa0197c5348))
* **haskell-nix:** missing haskell-nix ([d0e9664](https://github.com/LovelaceAcademy/nix-templates/commit/d0e96646d31fc1347c24ec68ffa9fe9a73746e47))
