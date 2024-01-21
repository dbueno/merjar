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
        pkgs = import nixpkgs { inherit system; };

        merjar-pkg = { python3, makeWrapper, lib }: python3.pkgs.buildPythonPackage rec {
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


          doCheck = false;
        };

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


