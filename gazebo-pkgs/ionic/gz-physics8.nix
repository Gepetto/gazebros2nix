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
  python3,
  sdformat,
  sdformat15,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-physics8";
  version = "8.4.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-physics";
    tag = "gz-physics8_8.4.0";
    hash = "sha256-jCv0W1Rvnnk0O8RkqRLnMnHEyYe6x9tDk0jq3D6nv7c=";
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
  nativeCheckInputs = [
    bullet
    dart
    eigen
    gbenchmark
    gz-common6
    gz-math8
    gz-plugin3
    gz-utils3
    sdformat15
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
