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
  ign-cmake,
  ign-math,
  ign-utils,
  pkg-config,
  spdlog,
  tinyxml-2,
  util-linux,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-common4";
  version = "4.8.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "ignition-common4_4.8.1";
    hash = "sha256-hM+WuIY7H5lONpS8OKXZ6AoTtSylXGhLDBsbIwn8VYQ=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
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
