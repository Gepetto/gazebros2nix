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
  gz-cmake3,
  gz-common,
  gz-common5,
  gz-fuel-tools,
  gz-fuel-tools9,
  gz-gui,
  gz-gui8,
  gz-math,
  gz-math7,
  gz-msgs,
  gz-msgs10,
  gz-physics,
  gz-physics7,
  gz-plugin,
  gz-plugin2,
  gz-rendering,
  gz-rendering8,
  gz-sensors,
  gz-sensors8,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-transport13,
  gz-utils,
  gz-utils2,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  qt5,
  sdformat,
  sdformat14,
  tinyxml-2,
  util-linux,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-sim8";
  version = "8.9.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sim";
    tag = "gz-sim8_8.9.0";
    hash = "sha256-hvhq2XBzcIoupJdJyJzk38LDXoEnd9iBCCiXvPZsPqY=";
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
    gz-cmake3
    gz-common
    gz-common5
    gz-fuel-tools
    gz-fuel-tools9
    gz-gui
    gz-gui8
    gz-math
    gz-math7
    gz-msgs
    gz-msgs10
    gz-physics
    gz-physics7
    gz-plugin
    gz-plugin2
    gz-rendering
    gz-rendering8
    gz-sensors
    gz-sensors8
    gz-tools
    gz-tools2
    gz-transport
    gz-transport13
    gz-utils
    gz-utils2
    protobuf
    python3
    python3Packages.pybind11
    qt5.qtbase
    qt5.qtdeclarative
    qt5.qtgraphicaleffects
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
    sdformat
    sdformat14
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
