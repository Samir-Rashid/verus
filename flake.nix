{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs {
            system = "x86_64-linux";
    };
   in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      # Use the same mkShell as documented above
      packages = with pkgs; [
        rustup
        z3_4_12 # Thanks, Morgan :)

        # For building verus-analyzer extension
        # pkg-config openssl openssl.dev
      ];
      shellHook = ''
        # fish
        # cd source/
        # source ../tools/activate.fish
        # set VERUS_Z3_PATH $(which z3)
        # ln -sf $(which z3) ./z3

        # # Build verus trunk from source
        # vargo build --release

        # ## Verus binary global path
        # set PATH "/home/mod/Documents/github/verus-tock/verus/source/target-verus/release/:$PATH"
      '';
      # For building verus-analyzer extension
      # PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
  };
}
