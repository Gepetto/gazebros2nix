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
  ign-cmake,
  ign-common,
  ign-fuel-tools,
  ign-gui,
  ign-math,
  ign-msgs,
  ign-physics,
  ign-plugin,
  ign-rendering,
  ign-sensors,
  ign-tools,
  ign-transport,
  ign-utils,
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
  pname = "ign-fortress-ign-gazebo6";
  version = "6.17.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sim";
    tag = "ignition-gazebo6_6.17.1";
    hash = "sha256-BaeOE00NwJiZgUS/7aUZ/ZY5pJww9t6pCTXDBsu4RTs=";
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
    ign-cmake
    ign-common
    ign-fuel-tools
    ign-gui
    ign-math
    ign-msgs
    ign-physics
    ign-plugin
    ign-rendering
    ign-sensors
    ign-tools
    ign-tools
    ign-transport
    ign-utils
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
