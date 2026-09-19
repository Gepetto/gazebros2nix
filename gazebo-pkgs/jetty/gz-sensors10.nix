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
  python3,
  sdformat,
  writableTmpDirAsHomeHook,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-sensors10";
  version = "10.1.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sensors";
    tag = "gz-sensors10_10.1.1";
    hash = "sha256-rSfTxdEpeFkhg3NMvGgc9PrMal3qkUuLW7R/FCLOd/w=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
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
    sdformat
  ];
  checkInputs = [
    xorg.xorgserver
  ];
  nativeCheckInputs = [
    gz-common
    gz-math
    gz-msgs
    gz-rendering
    gz-tools2
    gz-transport
    sdformat
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = false;

  meta = {
    description = "Gazebo Sensors : Sensor models for simulation";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-sensors";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
