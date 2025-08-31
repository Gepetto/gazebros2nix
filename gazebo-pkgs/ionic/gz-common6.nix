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
  gz-math8,
  gz-utils,
  gz-utils3,
  libz,
  pkg-config,
  spdlog,
  tinyxml-2,
  util-linux,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-common6";
  version = "6.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "gz-common6_6.1.0";
    hash = "sha256-D70bKjbSgg5Baye4hXWeAdeTSxgP157nQtZedY7cljE=";
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
    gz-math8
    gz-utils
    gz-utils3
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
