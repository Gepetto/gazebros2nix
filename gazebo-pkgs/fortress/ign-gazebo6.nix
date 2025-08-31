{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,

  cmake,
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
  pkg-config,
  protobuf,
  python3Packages,
  qt5,
  sdformat,
  tinyxml-2,
  util-linux,
  xorg,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-gazebo6";
  version = "6.17.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sim";
    tag = "ignition-gazebo6_6.17.0";
    hash = "sha256-ITTyehaK73tSRJZK8uXpO0+YjsFI6vFZ4XRy1prnGFc=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-sim/pull/3022.patch";
      hash = "sha256-/cACcshZ3nkepvgjiDkpMCZpee9704MYPkQNdRpZntU=";
    })
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    freeglut
    freeimage
    gbenchmark
    glew
    ign-cmake
    ign-cmake
    ign-common
    ign-common
    ign-fuel-tools
    ign-fuel-tools
    ign-gui
    ign-gui
    ign-math
    ign-math
    ign-msgs
    ign-msgs
    ign-physics
    ign-physics
    ign-plugin
    ign-plugin
    ign-rendering
    ign-rendering
    ign-sensors
    ign-sensors
    ign-tools
    ign-tools
    ign-transport
    ign-transport
    ign-utils
    ign-utils
    protobuf
    python3Packages.pybind11
    qt5.qtbase
    qt5.qtdeclarative
    qt5.qtgraphicaleffects
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
    sdformat
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
