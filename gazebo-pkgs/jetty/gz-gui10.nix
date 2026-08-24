{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-common,
  gz-math,
  gz-msgs,
  gz-plugin,
  gz-rendering,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-utils,
  pkg-config,
  protobuf,
  qt6,
  tinyxml-2,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-gui10";
  version = "10.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-gui";
    tag = "gz-gui10_10.1.0";
    hash = "sha256-UGvahx9+AJQ15ZlKymTc/S4bZkfK+KjIn17Ld1TSX9s=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-common
    gz-math
    gz-msgs
    gz-plugin
    gz-rendering
    gz-tools
    gz-tools2
    gz-transport
    gz-utils
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
