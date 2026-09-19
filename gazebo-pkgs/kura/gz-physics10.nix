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
  python3,
  sdformat,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-kura-gz-physics10";
  version = "10.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-physics";
    tag = "gz-physics10_10.0.0-pre1";
    hash = "sha256-2nnXivxevWzRFlf31XmIdcQt4FAklGMKIs0WdOYBqaY=";
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
    gz-math
    gz-plugin
    gz-utils
    sdformat
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    bullet
    dart
    eigen
    gbenchmark
    gz-common
    gz-math
    gz-plugin
    gz-utils
    sdformat
    writableTmpDirAsHomeHook
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
