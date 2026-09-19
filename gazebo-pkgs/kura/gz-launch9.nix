{
  lib,
  stdenv,
  fetchFromGitHub,

  binutils,
  cmake,
  gflags,
  gz-cmake,
  gz-common,
  gz-fuel-tools,
  gz-gui,
  gz-math,
  gz-msgs,
  gz-physics,
  gz-plugin,
  gz-rendering,
  gz-sensors,
  gz-sim,
  gz-tools,
  gz-tools2,
  gz-transport,
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
  writableTmpDirAsHomeHook,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-kura-gz-launch9";
  version = "9.0.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-launch";
    tag = "gz-launch9_9.0.1";
    hash = "sha256-tedpWzkWN3yTcDfEv2sEDuNvveybx26zQY03uzRkTEQ=";
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
    gz-common
    gz-fuel-tools
    gz-gui
    gz-math
    gz-msgs
    gz-physics
    gz-plugin
    gz-rendering
    gz-sensors
    gz-sim
    gz-tools
    gz-tools2
    gz-transport
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
  nativeCheckInputs = [
    binutils
    gflags
    gz-cmake
    gz-common
    gz-gui
    gz-math
    gz-msgs
    gz-plugin
    gz-sim
    gz-tools2
    gz-transport
    libwebsockets
    libxi
    libxmu
    libyaml
    tinyxml-2
    util-linux
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo Launch : Run and manage programs and plugins";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-launch";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
