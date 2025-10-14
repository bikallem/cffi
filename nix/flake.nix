{
  description = "MoonBit development environment with cffi";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: { })
          ];
        };
      in
      {
        devShells.default = pkgs.mkShell {         
          buildInputs = with pkgs; [
            # core development tools
            llvmPackages.clang-tools
            llvmPackages.clang
            llvmPackages.lldb
            llvmPackages.llvm
            valgrind
          ];

          # Environment variables that will be set          
          MOON_HOME = builtins.getEnv "HOME" + "/.moon";
        };
      }
    );
}
