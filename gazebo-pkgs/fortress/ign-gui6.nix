{
  lib,
  stdenv,
  fetchFromGitHub,

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
  qt6,
  tinyxml-2,
  xorg,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-gui6";
  version = "6.9.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-gui";
    tag = "ignition-gui6_6.9.0";
    hash = "sha256-vyz9QQGdQgBnrCe4KjJ601Q9E5JYPYruj7sCoz0zneM=";
  };

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
    protobuf
    qt6.qt5compat
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
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
