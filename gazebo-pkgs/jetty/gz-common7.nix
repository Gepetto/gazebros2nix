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
  version = "7.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-common";
    tag = "gz-common7_7.0.0";
    hash = "sha256-faoseEgvQmQzH0Ujb3GNavAEcJdxh6VSmCA4Uq9UgII=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-common/commit/58c6eaa7bd9c048264f3e0b33a36a744cca8d18c.patch?full_index=1";
      hash = "sha256-1MDiufVeNj54sWs0H200INVxS8mwzwR1UVMd523Byp0=";
    })
    (fetchpatch {
      url = "https://github.com/wentasah/gz-common/commit/8d18342302b7586b5b34c3cd12f2ef26e148b6ab.patch?full_index=1";
      hash = "sha256-Jtx1IShjLjaKsQ0x9RmTwPpbd3x07dOrt7bEXMTGnCw=";
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
