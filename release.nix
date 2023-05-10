let
  damlSdk = import ./dep/nix-daml-sdk {};
  pkgs = import ./dep/nixpkgs {};
  # Checks to make sure were only importing a subset of modules from daml-finance
  excludeWorkflowModules = builtins.concatStringsSep "|" [
    "import Daml.Finance.Interface.*"
    "import Daml.Finance.Claims.*"
  ];
in
  damlSdk.reflex-platform.nixpkgs.stdenv.mkDerivation {
    name = "syndicated-loan";
    src = ./.;
    buildPhase = "";
    buildInputs = [ damlSdk.jdk ];
    installPhase = ''
      mkdir $out
      ${damlSdk.sdk}/bin/daml test
      ${damlSdk.sdk}/bin/daml build -o $out/package.dar

      find_modules=$(find $src/daml/Workflow -name "*.daml" -type f -print0 | xargs -0 grep -o "import Daml.Finance.*" | grep -Ev "${excludeWorkflowModules}")
      if [[ $? == 0 ]]; then
        for i in $find_modules; do
          echo "''${i%%:*}"
        done
        exit 127
      else
        echo "SUCCESS"
      fi
    '';
}
