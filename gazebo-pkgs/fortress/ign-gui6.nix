{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,

  cmake,
  ign-cmake,
  ign-common,
  ign-math,
  ign-msgs,
  ign-plugin,
  ign-rendering,
  ign-tools,
  ign-transport,
  ign-utils,
  libqt6svg6,
  pkg-config,
  protobuf,
  qml6-module-qt-labs-folderlistmodel,
  qml6-module-qt-labs-platform,
  qml6-module-qt-labs-settings,
  qml6-module-qt5compat-graphicaleffects,
  qml6-module-qtcharts,
  qml6-module-qtcore,
  qml6-module-qtpositioning,
  qml6-module-qtqml,
  qml6-module-qtqml-models,
  qml6-module-qtqml-workerscript,
  qml6-module-qtquick-controls,
  qml6-module-qtquick-dialogs,
  qml6-module-qtquick-layouts,
  qml6-module-qtquick-templates,
  qml6-module-qtquick-window,
  qt6,
  qt6-5compat-dev,
  qt6-base-private-dev,
  qt6-declarative-private-dev,
  tinyxml-2,
  xorg,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-gui6";
  version = "6.8.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-gui";
    tag = "ignition-gui6_6.8.0";
    hash = "sha256-58VEAujQEWJfooAJWueTWVGWiPrYlmyYbfVvKU4B0d8=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-gui/pull/544.patch";
      hash = "sha256-kr5bowr9/aHnuJsRZ/2Igf96BNKNr4Z2dDz0iv7AzA8=";
    })
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-gui/pull/696.patch";
      hash = "sha256-eYGYYGkaWOp0H97hyMKk/5p5zAfPd+X5HPM+0NDp07U=";
    })
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    ign-cmake
    ign-common
    ign-math
    ign-msgs
    ign-plugin
    ign-rendering
    ign-tools
    ign-tools
    ign-transport
    ign-utils
    libqt6svg6
    protobuf
    qml6-module-qt-labs-folderlistmodel
    qml6-module-qt-labs-platform
    qml6-module-qt-labs-settings
    qml6-module-qt5compat-graphicaleffects
    qml6-module-qtcharts
    qml6-module-qtcore
    qml6-module-qtpositioning
    qml6-module-qtqml
    qml6-module-qtqml-models
    qml6-module-qtqml-workerscript
    qml6-module-qtquick-controls
    qml6-module-qtquick-dialogs
    qml6-module-qtquick-layouts
    qml6-module-qtquick-templates
    qml6-module-qtquick-window
    qt6-5compat-dev
    qt6-base-private-dev
    qt6-declarative-private-dev
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtquickcontrols
    tinyxml-2
  ];
  checkInputs = [
    xorg.xorgserver
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo GUI : Graphical interfaces for robotics applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-gui";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
