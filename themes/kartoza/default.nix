{ stdenvNoCC, ... }:
stdenvNoCC.mkDerivation {
  pname = "kartoza-grub-theme";
  version = "0.2.0";

  # If your theme files live in ./assets (theme.txt, icons/, etc.)
  src = ./assets;

  # No build system here
  dontConfigure = true;
  dontBuild = true;

  # Install to the conventional GRUB themes path
  installPhase = ''
    runHook preInstall
    mkdir -p "$out"
    cp -r assets/* "$out/"
    runHook postInstall
  '';

  meta.description = "Kartoza GRUB theme";
}
