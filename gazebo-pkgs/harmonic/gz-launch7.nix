{
  lib,
  stdenv,
  fetchFromGitHub,

  binutils,
  cmake,
  gflags,
  gz-cmake,
  gz-cmake3,
  gz-common,
  gz-common5,
  gz-fuel-tools,
  gz-gui,
  gz-gui8,
  gz-math,
  gz-math7,
  gz-msgs,
  gz-msgs10,
  gz-physics,
  gz-plugin,
  gz-plugin2,
  gz-rendering,
  gz-sensors,
  gz-sim,
  gz-sim8,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-transport13,
  gz-utils,
  libwebsockets,
  libxi,
  libxmu,
  libyaml,
  pkg-config,
  python3,
  sdformat,
  tinyxml-2,
  util-linux,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-launch7";
  version = "7.1.2";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-launch";
    tag = "gz-launch7_7.1.2";
    hash = "sha256-bGK1ygCNTBzYJWBoezzD6Ls3tqnmZv60T6MtS7xFYfI=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    binutils
    gflags
    gz-cmake
    gz-cmake3
    gz-common
    gz-common5
    gz-fuel-tools
    gz-gui
    gz-gui8
    gz-math
    gz-math7
    gz-msgs
    gz-msgs10
    gz-physics
    gz-plugin
    gz-plugin2
    gz-rendering
    gz-sensors
    gz-sim
    gz-sim8
    gz-tools
    gz-tools2
    gz-transport
    gz-transport13
    gz-utils
    libwebsockets
    libxi
    libxmu
    libyaml
    sdformat
    tinyxml-2
    util-linux
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
