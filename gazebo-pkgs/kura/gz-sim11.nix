{
  lib,
  stdenv,
  fetchFromGitHub,

  binutils,
  cmake,
  elfutils,
  freeglut,
  freeimage,
  gbenchmark,
  glew,
  gz-cmake,
  gz-common,
  gz-fuel-tools,
  gz-gui,
  gz-math,
  gz-msgs,
  gz-physics,
  gz-plugin,
  gz-rendering,
  gz-sensors,
  gz-tools,
  gz-transport,
  gz-utils,
  libdwarf,
  libwebsockets,
  libxi,
  libxmu,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  qt6,
  sdformat,
  tinyxml-2,
  util-linux,
  writableTmpDirAsHomeHook,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-kura-gz-sim11";
  version = "11.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sim";
    tag = "gz-sim11_11.0.0-pre1";
    hash = "sha256-x1LzlEtu/Q2DnuZTWQ0p8hAFF/RwMH011tTuQa9XWBs=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    binutils
    elfutils
    freeglut
    freeimage
    gbenchmark
    glew
    gz-cmake
    gz-common
    gz-fuel-tools
    gz-gui
    gz-math
    gz-msgs
    gz-physics
    gz-plugin
    gz-rendering
    gz-sensors
    gz-tools
    gz-transport
    gz-utils
    libdwarf
    libwebsockets
    libxi
    libxmu
    protobuf
    python3Packages.pybind11
    qt6.qt5compat
    qt6.qtbase
    qt6.qtdeclarative
    sdformat
    tinyxml-2
    util-linux
  ];
  checkInputs = [
    python3Packages.pytest
    xorg.xorgserver
  ];
  nativeCheckInputs = [
    binutils
    elfutils
    freeglut
    freeimage
    gbenchmark
    glew
    gz-cmake
    gz-common
    gz-fuel-tools
    gz-gui
    gz-math
    gz-msgs
    gz-physics
    gz-plugin
    gz-rendering
    gz-sensors
    gz-tools
    gz-transport
    gz-utils
    libdwarf
    libwebsockets
    libxi
    libxmu
    protobuf
    python3Packages.pybind11
    qt6.qt5compat
    qt6.qtbase
    qt6.qtdeclarative
    sdformat
    tinyxml-2
    util-linux
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = false;

  meta = {
    description = "Gazebo Sim : A Robotic Simulator";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-sim";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
