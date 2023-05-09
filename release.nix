let
  damlSdk = import ./dep/nix-daml-sdk {};
  pkgs = import ./dep/nixpkgs {};
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
    '';
}
