with import <nixpkgs> {};
let
  libpath = with xorg; stdenv.lib.makeLibraryPath [ libX11 libXext libXcursor libXrandr libXxf86vm libpulseaudio ];
in stdenv.mkDerivation rec {
    name = "minecraftdev";

    shellHook = ''
        export GAME_LIBRARY_PATH=/run/opengl-driver/lib:${libpath}
    '';
}