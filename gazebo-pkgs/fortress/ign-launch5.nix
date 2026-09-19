{
  lib,
  stdenv,
  fetchFromGitHub,

  binutils,
  cmake,
  gflags,
  gz-cmake,
  gz-common,
  gz-gui,
  gz-math,
  gz-msgs,
  gz-plugin,
  gz-sim,
  gz-tools2,
  gz-transport,
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
  pname = "ign-fortress-ign-launch5";
  version = "5.3.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-launch";
    tag = "ignition-launch5_5.3.1";
    hash = "sha256-sgAr6A/+lzbV7QxMfAuLF3W5glzDkV/0vOE+tE0x7Ww=";
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
    ign-cmake
    ign-common
    ign-fuel-tools
    ign-gui
    ign-math
    ign-msgs
    ign-physics
    ign-plugin
    ign-rendering
    ign-sensors
    ign-sim
    ign-tools
    ign-tools
    ign-transport
    ign-utils
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

  doCheck = false;
  doInstallCheck = false;

  meta = {
    description = "Gazebo Launch : Run and manage programs and plugins";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-launch";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
