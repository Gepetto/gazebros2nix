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
  gz-transport,
  gz-utils,
  pkg-config,
  python3,
  sdformat,
  writableTmpDirAsHomeHook,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-kura-gz-sensors11";
  version = "11.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sensors";
    tag = "gz-sensors11_11.0.0-pre2";
    hash = "sha256-2WICP5UqGxIzP9gOhQ552i82C+30IPQ6T0QPhUsporo=";
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
    gz-tools
    gz-transport
    gz-utils
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
