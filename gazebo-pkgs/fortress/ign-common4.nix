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
  version = "4.7.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "ignition-common4_4.7.0";
    hash = "sha256-y8qp0UVXxSJm0aJeUD64+aG+gfNEboInW7F6tvHYTPI=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-common/pull/521.patch";
      hash = "sha256-NlUyAfGugYuNYURY1NjgStNsJ+jrLuaHmJ8Gp9QBSmQ=";
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
    ign-cmake
    ign-math
    ign-math
    ign-utils
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
