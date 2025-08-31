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
  gz-common5,
  gz-math,
  gz-math7,
  gz-plugin,
  gz-plugin2,
  gz-utils,
  gz-utils2,
  pkg-config,
  sdformat,
  sdformat14,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-physics7";
  version = "7.5.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-physics";
    tag = "gz-physics7_7.5.0";
    hash = "sha256-75myTqDeEybvj5rsJxRambLPle1cen6HIatZGbVoXro=";
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
    gz-common5
    gz-math
    gz-math7
    gz-plugin
    gz-plugin2
    gz-utils
    gz-utils2
    sdformat
    sdformat14
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
