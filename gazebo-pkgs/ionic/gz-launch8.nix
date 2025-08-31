{
  lib,
  stdenv,
  fetchFromGitHub,

  binutils,
  cmake,
  gflags,
  gz-cmake,
  gz-cmake4,
  gz-common,
  gz-common6,
  gz-fuel-tools,
  gz-gui,
  gz-gui9,
  gz-math,
  gz-math8,
  gz-msgs,
  gz-msgs11,
  gz-physics,
  gz-plugin,
  gz-plugin3,
  gz-rendering,
  gz-sensors,
  gz-sim,
  gz-sim9,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-transport14,
  gz-utils,
  libwebsockets,
  libyaml,
  pkg-config,
  sdformat,
  tinyxml-2,
  util-linux,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-launch8";
  version = "8.0.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-launch";
    tag = "gz-launch8_8.0.1";
    hash = "sha256-el+4sVBOmeBj8VJqKut8pIhVJeyEyodrt6titunbBF0=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    binutils
    gflags
    gz-cmake
    gz-cmake4
    gz-common
    gz-common6
    gz-fuel-tools
    gz-gui
    gz-gui9
    gz-math
    gz-math8
    gz-msgs
    gz-msgs11
    gz-physics
    gz-plugin
    gz-plugin3
    gz-rendering
    gz-sensors
    gz-sim
    gz-sim9
    gz-tools
    gz-tools2
    gz-transport
    gz-transport14
    gz-utils
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
