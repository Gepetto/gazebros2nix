{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,

  cmake,
  gz-cmake,
  gz-common,
  gz-common5,
  gz-math,
  gz-math7,
  gz-msgs,
  gz-msgs10,
  gz-plugin,
  gz-plugin2,
  gz-rendering,
  gz-rendering8,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-transport13,
  gz-utils,
  gz-utils2,
  pkg-config,
  protobuf,
  qt5,
  tinyxml-2,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-gui8";
  version = "8.4.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-gui";
    tag = "gz-gui8_8.4.0";
    hash = "sha256-gf9XZzAX2g6r9ThIA0v2H2X/+uu9VnwvyvrdL5ZazM0=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-gui/pull/676.patch";
      hash = "sha256-EVuGTAT/U3So/K1ti2B0QdMr2AErjRLDgENWkGZYMXc=";
    })
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-common
    gz-common5
    gz-math
    gz-math7
    gz-msgs
    gz-msgs10
    gz-plugin
    gz-plugin2
    gz-rendering
    gz-rendering8
    gz-tools
    gz-tools2
    gz-transport
    gz-transport13
    gz-utils
    gz-utils2
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
