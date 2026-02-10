{
  lib,
  stdenv,
  fetchFromGitHub,

  bullet,
  cmake,
  dart,
  eigen,
  gbenchmark,
  ign-cmake,
  ign-common,
  ign-math,
  ign-plugin,
  ign-utils,
  pkg-config,
  sdformat,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-physics5";
  version = "5.4.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-physics";
    tag = "ignition-physics5_5.4.0";
    hash = "sha256-nHtxWJtp69iJzojz0G4Cc+vEPOBHQtOdD5N0zR5uBZg=";
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
    ign-cmake
    ign-common
    ign-math
    ign-plugin
    ign-utils
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
