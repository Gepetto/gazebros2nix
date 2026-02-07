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
  qt6,
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
      url = "https://github.com/gazebosim/gz-gui/pull/544.patch?full_index=1";
      hash = "sha256-qxPkW5+eofA/Cdta2p3bflebFu1bCVOX7sEps1ezB0E=";
    })
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-gui/pull/696.patch?full_index=1";
      hash = "sha256-LHoPW5nL4aezVkt6hIYecbQK6Jr6SAcWDkgRJXgIHIw=";
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
