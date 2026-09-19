{
  lib,
  stdenv,
  fetchFromGitHub,

  assimp,
  cmake,
  ffmpeg,
  gdal,
  gz-cmake,
  gz-math,
  gz-utils,
  libz,
  pkg-config,
  python3,
  spdlog,
  tinyxml-2,
  util-linux,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-common7";
  version = "7.4.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "gz-common7_7.4.0";
    hash = "sha256-XxAAva64aZWPk12H9dXioW/PmM42w5PSD8MnvM2dl5s=";
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
  nativeCheckInputs = [
    assimp
    ffmpeg
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
