{
  description = "Formal Verification in Lean 4 — course dev environment aligned with Lean-blaster";

  inputs = {
    nixpkgs.follows = "lean4-nix/nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    lean4-nix.url = "github:lenianiva/lean4-nix";
  };

  outputs =
    inputs @ { flake-parts, nixpkgs, lean4-nix, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        { system, pkgs, ... }:
        {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            overlays = [
              # Align z3 with Lean-blaster (4.15.2)
              (_final: prev: {
                z3 = prev.z3.overrideAttrs {
                  version = "4.15.2";
                  src = prev.fetchFromGitHub {
                    owner = "Z3Prover";
                    repo = "z3";
                    rev = "z3-4.15.2";
                    hash = "sha256-hUGZdr0VPxZ0mEUpcck1AC0MpyZMjiMw/kK8WX7t0xU=";
                  };
                };
              })
            ];
          };

          devShells.default = pkgs.mkShell {
            name = "lean4-course";
            packages = [
              pkgs.elan
              pkgs.z3
            ];
            shellHook = ''
              echo "Lean 4 course dev shell (aligned with Lean-blaster)"
              echo "  lean    : $(lean --version 2>/dev/null || echo n/a)"
              echo "  z3      : $(z3 --version 2>/dev/null || echo n/a)"
              echo "  (z3check: build from Lean-blaster clone via 'lake build Z3Check')"
            '';
          };

          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
