{ stdenvNoCC, ... }:
stdenvNoCC.mkDerivation {
  pname = "kartoza-grub-theme";
  version = "0.1.0";

  # If your theme files live in ./assets (theme.txt, icons/, etc.)
  src = ./assets;

  # No build system here
  dontConfigure = true;
  dontBuild = true;

  # Install to the conventional GRUB themes path
  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/grub/themes/kartoza"
    cp -r $src/* "$out/share/grub/themes/kartoza/"
    runHook postInstall
  '';

  meta.description = "Kartoza GRUB theme";
}
