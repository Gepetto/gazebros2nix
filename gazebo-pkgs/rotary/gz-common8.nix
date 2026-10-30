{
  lib,
  stdenv,
  fetchFromGitHub,

  assimp,
  cmake,
  ffmpeg,
  gbenchmark,
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
  pname = "gz-rotary-gz-common8";
  version = "8.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "gz-common8_8.0.0-pre2";
    hash = "sha256-1r9cu/Grme6mZyWLiwxJ3F+h691AMZ3MV33QumBjXNs=";
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
  doInstallCheck = true;

  meta = {
    description = "Gazebo Common : AV, Graphics, Events, and much more.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-common";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
