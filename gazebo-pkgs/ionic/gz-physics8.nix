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
  gz-common6,
  gz-math,
  gz-math8,
  gz-plugin,
  gz-plugin3,
  gz-utils,
  gz-utils3,
  pkg-config,
  sdformat,
  sdformat15,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-physics8";
  version = "8.3.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-physics";
    tag = "gz-physics8_8.3.0";
    hash = "sha256-U02OIZ59IMxxbZeC8bjqmFKmfWTzDTc7F4YO5gsJdYg=";
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
    gz-common6
    gz-math
    gz-math8
    gz-plugin
    gz-plugin3
    gz-utils
    gz-utils3
    sdformat
    sdformat15
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
