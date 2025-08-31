{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,

  assimp,
  cmake,
  ffmpeg,
  freeimage,
  gdal,
  gts,
  gz-cmake,
  gz-math,
  gz-math7,
  gz-utils,
  gz-utils2,
  pkg-config,
  tinyxml-2,
  util-linux,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-common5";
  version = "5.7.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "gz-common5_5.7.1";
    hash = "sha256-vNCjCSQYCSUHXKwXnq8vwWXiSK2+cD3yPSLT1FdAWrE=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-common/pull/660.patch";
      hash = "sha256-LJBGGzUgS/AhKWawTeLpnOteJj3PdN9MR4wacuEgxVc=";
    })
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    assimp
    ffmpeg
    freeimage
    gdal
    gts
    gz-cmake
    gz-math
    gz-math7
    gz-utils
    gz-utils2
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
