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
  pkg-config,
  protobuf,
  qt5,
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
    ign-common
    ign-math
    ign-math
    ign-msgs
    ign-msgs
    ign-plugin
    ign-plugin
    ign-rendering
    ign-rendering
    ign-tools
    ign-tools
    ign-transport
    ign-transport
    ign-utils
    ign-utils
    protobuf
    qt5.qtbase
    qt5.qtcharts
    qt5.qtdeclarative
    qt5.qtgraphicaleffects
    qt5.qtlocation
    qt5.qtpositioning
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
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
