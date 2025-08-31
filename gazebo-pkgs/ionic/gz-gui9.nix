{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,

  cmake,
  gz-cmake,
  gz-common,
  gz-common6,
  gz-math,
  gz-math8,
  gz-msgs,
  gz-msgs11,
  gz-plugin,
  gz-plugin3,
  gz-rendering,
  gz-rendering9,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-transport14,
  gz-utils,
  gz-utils3,
  pkg-config,
  protobuf,
  qt5,
  tinyxml-2,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-gui9";
  version = "9.0.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-gui";
    tag = "gz-gui9_9.0.1";
    hash = "sha256-ZBDgd37TPBOldorGZimsCk57fVa7tTc8wRwUGFBZnDk=";
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
    gz-common6
    gz-math
    gz-math8
    gz-msgs
    gz-msgs11
    gz-plugin
    gz-plugin3
    gz-rendering
    gz-rendering9
    gz-tools
    gz-tools2
    gz-transport
    gz-transport14
    gz-utils
    gz-utils3
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
