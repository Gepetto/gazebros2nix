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
  gz-tools2,
  gz-transport,
  gz-utils,
  libdwarf,
  libwebsockets,
  pkg-config,
  protobuf,
  python3Packages,
  qt6,
  sdformat,
  tinyxml-2,
  util-linux,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-sim10";
  version = "10.1.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sim";
    tag = "gz-sim10_10.1.1";
    hash = "sha256-pFzpusR7bJAQOZqTGZ79DP9fMIcKNl2gbWW+Zw5tNgs=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
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
    gz-tools2
    gz-transport
    gz-utils
    libdwarf
    libwebsockets
    protobuf
    python3Packages.pybind11
    qt6.qt5compat
    qt6.qtbase
    qt6.qtdeclarative
    sdformat
    tinyxml-2
    util-linux
    xorg.libXi
    xorg.libXmu
  ];
  checkInputs = [
    python3Packages.pytest
    xorg.xorgserver
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Sim : A Robotic Simulator";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-sim";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
