{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-compat } :
    flake-utils.lib.eachDefaultSystem (system:
      let
        merjar-pkg = { python3Packages, makeWrapper, lib }: python3Packages.buildPythonApplication rec {
          name = "merjar";
          version = "0.0.1";
          src =
            let
              elide = [];
            in
            with builtins;
            filterSource
            (path: type: !(elem (baseNameOf path) elide))
            ./.;

          build-system = with python3Packages; [ setuptools ];

          doCheck = false;
          meta.mainProgram = "merjar";
        };

        pkgs = import nixpkgs { inherit system; };
        merjar = pkgs.callPackage merjar-pkg {};

      in {
        packages = {
          inherit merjar;
        };
        defaultPackage = merjar;
        devShell =
          pkgs.mkShell {
            inputsFrom = [ ];
            packages =
              with pkgs; [
                python3
                pyright
              ];
            hardeningDisable = [ "all" ];
            shellHook = ''
              export PYTHONPATH=`pwd`/src
            '';
          };
      });
}


