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
      find $src/daml/Workflow -name "*.daml" -type f -print0 | xargs -0 grep -o "import Daml.Finance.*" | grep -Ev "${excludeWorkflowModules}"
    '';
}
