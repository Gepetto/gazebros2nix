{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  freeglut,
  freeimage,
  gbenchmark,
  glew,
  gz-cmake,
  gz-cmake4,
  gz-common,
  gz-common6,
  gz-fuel-tools,
  gz-fuel-tools10,
  gz-gui,
  gz-gui9,
  gz-math,
  gz-math8,
  gz-msgs,
  gz-msgs11,
  gz-physics,
  gz-physics8,
  gz-plugin,
  gz-plugin3,
  gz-rendering,
  gz-rendering9,
  gz-sensors,
  gz-sensors9,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-transport14,
  gz-utils,
  gz-utils3,
  pkg-config,
  protobuf,
  python3Packages,
  qt5,
  sdformat,
  sdformat15,
  tinyxml-2,
  util-linux,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-sim9";
  version = "9.3.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sim";
    tag = "gz-sim9_9.3.0";
    hash = "sha256-v8YgOIRQE5gLjn5/cBIK0usMYZYKdVZ1GQJGAgaDxoc=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    freeglut
    freeimage
    gbenchmark
    glew
    gz-cmake
    gz-cmake4
    gz-common
    gz-common6
    gz-fuel-tools
    gz-fuel-tools10
    gz-gui
    gz-gui9
    gz-math
    gz-math8
    gz-msgs
    gz-msgs11
    gz-physics
    gz-physics8
    gz-plugin
    gz-plugin3
    gz-rendering
    gz-rendering9
    gz-sensors
    gz-sensors9
    gz-tools
    gz-tools2
    gz-transport
    gz-transport14
    gz-utils
    gz-utils3
    protobuf
    python3Packages.pybind11
    qt5.qtbase
    qt5.qtdeclarative
    qt5.qtgraphicaleffects
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
    sdformat
    sdformat15
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
