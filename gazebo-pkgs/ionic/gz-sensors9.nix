{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-common,
  gz-common6,
  gz-math,
  gz-math8,
  gz-msgs,
  gz-msgs11,
  gz-plugin,
  gz-rendering,
  gz-rendering9,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-transport14,
  gz-utils,
  pkg-config,
  python3,
  sdformat,
  sdformat15,
  writableTmpDirAsHomeHook,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-sensors9";
  version = "9.2.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sensors";
    tag = "gz-sensors9_9.2.0";
    hash = "sha256-Vxl3xdmh8ybRbjDxNGt8qgQOP9ctAcYAoVwWeytAglc=";
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
    gz-common6
    gz-math
    gz-math8
    gz-msgs
    gz-msgs11
    gz-plugin
    gz-rendering
    gz-rendering9
    gz-tools
    gz-tools2
    gz-transport
    gz-transport14
    gz-utils
    sdformat
    sdformat15
  ];
  checkInputs = [
    xorg.xorgserver
  ];
  nativeCheckInputs = [
    gz-common6
    gz-math8
    gz-msgs11
    gz-rendering9
    gz-tools2
    gz-transport14
    sdformat15
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
