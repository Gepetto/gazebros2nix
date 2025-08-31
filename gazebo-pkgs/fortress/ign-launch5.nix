{
  lib,
  stdenv,
  fetchFromGitHub,

  binutils,
  cmake,
  gflags,
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
  ign-sim,
  ign-tools,
  ign-transport,
  ign-utils,
  libwebsockets,
  libyaml,
  pkg-config,
  sdformat,
  tinyxml-2,
  util-linux,
  xorg,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-launch5";
  version = "5.3.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-launch";
    tag = "ignition-launch5_5.3.0";
    hash = "sha256-1IJg6M06smyCp9yuHzHgZFRb+af/jpXWwETwq1FDAeU=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    binutils
    gflags
    ign-cmake
    ign-cmake
    ign-common
    ign-common
    ign-fuel-tools
    ign-gui
    ign-gui
    ign-math
    ign-math
    ign-msgs
    ign-msgs
    ign-physics
    ign-plugin
    ign-plugin
    ign-rendering
    ign-sensors
    ign-sim
    ign-sim
    ign-tools
    ign-tools
    ign-transport
    ign-transport
    ign-utils
    libwebsockets
    libyaml
    sdformat
    tinyxml-2
    util-linux
    xorg.libXi
    xorg.libXmu
  ];
  checkInputs = [
    xorg.xorgserver
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Launch : Run and manage programs and plugins";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-launch";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
