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
  qml6-module-qt-labs-folderlistmodel,
  qml6-module-qt-labs-settings,
  qml6-module-qt5compat-graphicaleffects,
  qml6-module-qtquick-controls,
  qml6-module-qtquick-dialogs,
  qml6-module-qtquick-layouts,
  qt6,
  qt6-5compat-dev,
  qt6-base-private-dev,
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
    protobuf
    python3Packages.pybind11
    qml6-module-qt-labs-folderlistmodel
    qml6-module-qt-labs-settings
    qml6-module-qt5compat-graphicaleffects
    qml6-module-qtquick-controls
    qml6-module-qtquick-dialogs
    qml6-module-qtquick-layouts
    qt6-5compat-dev
    qt6-base-private-dev
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtquickcontrols
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
