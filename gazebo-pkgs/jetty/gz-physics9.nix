{
  lib,
  stdenv,
  fetchFromGitHub,

  bullet,
  cmake,
  dart,
  eigen,
  gbenchmark,
  gz-cmake,
  gz-common,
  gz-math,
  gz-plugin,
  gz-utils,
  pkg-config,
  sdformat,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-physics9";
  version = "9.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-physics";
    tag = "gz-physics9_9.1.0";
    hash = "sha256-9JM/vtDOOfwpmc4cu1XEE0FSgaYBaLAD7dCvqI7MuMY=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    bullet
    dart
    eigen
    gbenchmark
    gz-cmake
    gz-common
    gz-math
    gz-plugin
    gz-utils
    sdformat
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Physics : Physics classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-physics";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
