{ stdenvNoCC, ... }:
stdenvNoCC.mkDerivation {
  pname = "kartoza-grub-theme";
  version = "0.3.0";

  # If your theme files live in ./assets (theme.txt, icons/, etc.)
  src = ./assets;

  # No build system here
  dontConfigure = true;
  dontBuild = true;

  # Install to the conventional GRUB themes path
  installPhase = ''
    runHook preInstall
    echo "copying theme from $src to $out"
    mkdir -p "$out"
    cp -r $src/* "$out/"
    runHook postInstall
  '';

  meta.description = "Kartoza GRUB theme";
}
