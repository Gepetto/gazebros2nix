{
  lib,
  stdenv,
  fetchFromGitHub,

  assimp,
  cmake,
  ffmpeg,
  gbenchmark,
  gdal,
  gts,
  gz-math,
  gz-utils,
  ign-cmake,
  ign-math,
  ign-utils,
  pkg-config,
  python3,
  spdlog,
  tinyxml-2,
  util-linux,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-common4";
  version = "4.9.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "ignition-common4_4.9.0";
    hash = "sha256-Gj5sP7ng6aZOV0M2WAB4nDZCglb6QHI+/LVC6kcf7yY=";
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
    gbenchmark
    gdal
    gts
    ign-cmake
    ign-math
    ign-utils
    spdlog
    tinyxml-2
    util-linux
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    assimp
    ffmpeg
    gbenchmark
    gdal
    gz-math
    gz-utils
    spdlog
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
