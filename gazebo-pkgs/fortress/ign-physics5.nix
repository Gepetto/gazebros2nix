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
  python3,
  sdformat,
  writableTmpDirAsHomeHook,
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

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
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
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = false;

  meta = {
    description = "Gazebo Physics : Physics classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-physics";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
