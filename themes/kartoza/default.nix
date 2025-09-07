pkgs:
pkgs.stdenv.mkDerivation {
  name = "kartoza-grub-theme";
  src = ./assets;
  installPhase = "cp -r $src/* $out/";
}
