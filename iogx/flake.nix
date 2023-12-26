{
  inputs.iogx.url = "github:input-output-hk/iogx";
  inputs.nixpkgs.follows = "iogx/nixpkgs";
  outputs = { self, iogx, ... }@inputs:
    iogx.lib.mkFlake {
      inherit inputs;
      repoRoot = ./.;
      outputs = import ./nix/outputs.nix;
      # TODO add x86_64-darwin on iogx (default)
      systems = [ "x86_64-linux" ];
    };

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    accept-flake-config = true;
    extra-experimental-features = "nix-command flakes";
    allow-import-from-derivation = "true";
    # This sets the flake to use nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [
      "https://cache.tcp4.me?priority=99"
      "https://cache.iog.io"
    ];
    extra-trusted-public-keys = [
      "cache.tcp4.me:cmk2Iz81lQuX7FtTUcBgtqgI70E8p6SOamNAIcFDSew="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];
  };
}
