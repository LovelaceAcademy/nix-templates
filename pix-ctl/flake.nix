{
  inputs = {
    ctl-nix.url = "github:LovelaceAcademy/ctl-nix";
    ctl.follows = "ctl-nix/ctl";
    nixpkgs.follows = "ctl/nixpkgs";
    purs-nix.follows = "ctl-nix/purs-nix";
    ps-tools.follows = "ctl-nix/purs-nix/ps-tools";
    utils.url = "github:ursi/flake-utils";
    script.url = "github:LovelaceAcademy/nix-templates?dir=iogx-plutus";
  };

  outputs = { self, utils, ... }@inputs:
    let
      # TODO add missing arm to match standard systems
      #  right now purs-nix is only compatible with x86_64-linux
      systems = [ "x86_64-linux" ];
      overlays = with inputs.ctl.overlays; [
        # adds easy-ps for CTL
        purescript
        # adds:
        #  plutip-server
        #  ogmios
        #  kupo
        # runtime
      ];
    in
    utils.apply-systems
      { inherit inputs systems overlays; }
      ({ system, pkgs, ... }@ctx:
        let
          inherit (pkgs) nodejs;
          # TODO Use a default purs version from CTL
          inherit (ctx.ps-tools.for-0_15)
            purescript purs-tidy purescript-language-server;
          purs-nix = inputs.purs-nix {
            inherit system;
            overlays = [ ctx.ctl-nix ];
          };
          scripts = pkgs.runCommand
            "scripts"
            {
              buildInputs = [ ctx.script.iogx-plutus ];
            }
            ''
              mkdir -p $out/Scripts
              iogx-plutus > script.json
              (echo "export default "; cat script.json) \
                > $out/Scripts/scriptV2.mjs
            '';
          ps = purs-nix.purs
            {
              inherit purescript nodejs;
              # Project dir (src, test)
              dir = ./.;
              # Dependencies
              dependencies =
                with purs-nix.ps-pkgs;
                [
                  cardano-transaction-lib
                ];
              # FFI dependencies
              foreign."Scripts".node_modules = scripts;
            };
          ps-command = ps.command { };
          concurrent = pkgs.writeShellApplication {
            name = "concurrent";
            runtimeInputs = with pkgs; [ concurrently ];
            text = ''
              concurrently\
                --color "auto"\
                --prefix "[{command}]"\
                --handle-input\
                --restart-tries 10\
                "$@"
            '';
          };
          purs-watch = pkgs.writeShellApplication {
            name = "purs-watch";
            runtimeInputs = with pkgs; [ entr ps-command ];
            text = ''find src | entr -s "purs-nix $*"'';
          };
          docs = pkgs.writeShellApplication {
            name = "docs";
            runtimeInputs = with pkgs; [
              concurrent
              nodejs
              purs-watch
            ];
            text = ''
              concurrent \
              "purs-watch docs" \
              "npx http-server ./generated-docs/html -o"
            '';
          };
        in
        {
          packages.default = ps.output { };

          devShells.default =
            pkgs.mkShell
              {
                packages = with pkgs; [
                  purescript
                  purescript-language-server
                  purs-tidy
                  ps-command
                  docs
                ];
              };
        });

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    extra-experimental-features = "nix-command flakes";
    # This sets the flake to use nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [
      "https://cache.tcp4.me?priority=99"
      "https://cache.iog.io"
      "https://cache.zw3rk.com"
      "https://hercules-ci.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.tcp4.me:cmk2Iz81lQuX7FtTUcBgtqgI70E8p6SOamNAIcFDSew="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
      "hercules-ci.cachix.org-1:ZZeDl9Va+xe9j+KqdzoBZMFJHVQ42Uu/c/1/KMC5Lw0="
    ];
  };
}
