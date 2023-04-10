# Changelog

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
