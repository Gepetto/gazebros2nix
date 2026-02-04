{
  lib,
  stdenv,
  fetchFromGitHub,

  assimp,
  cmake,
  ffmpeg,
  freeimage,
  gdal,
  gz-cmake,
  gz-math,
  gz-utils,
  libz,
  pkg-config,
  spdlog,
  tinyxml-2,
  util-linux,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-common7";
  version = "7.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "gz-common7_7.1.0";
    hash = "sha256-CtQL2/ndK+vcNoIzBiGLI+S+GYDH3ID9nC8GxmzcpJ4=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    assimp
    ffmpeg
    freeimage
    gdal
    gz-cmake
    gz-math
    gz-utils
    libz
    spdlog
    tinyxml-2
    util-linux
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Common : AV, Graphics, Events, and much more.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-common";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
