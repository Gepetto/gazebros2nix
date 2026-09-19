{
  lib,
  stdenv,
  fetchFromGitHub,

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
  python3,
  tinyxml-2,
  util-linux,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-common5";
  version = "5.9.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "gz-common5_5.9.0";
    hash = "sha256-gv1JoSE+hELzYAHLJLo9uGC2ZZf9f+Rcd9g2j1LI6q4=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
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
  nativeCheckInputs = [
    assimp
    ffmpeg
    freeimage
    gdal
    gts
    gz-math7
    gz-utils2
    tinyxml-2
    util-linux
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = false;

  meta = {
    description = "Gazebo Common : AV, Graphics, Events, and much more.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-common";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
