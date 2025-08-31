{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-common,
  gz-common5,
  gz-math,
  gz-math7,
  gz-msgs,
  gz-msgs10,
  gz-plugin,
  gz-rendering,
  gz-rendering8,
  gz-tools,
  gz-tools2,
  gz-transport,
  gz-transport13,
  gz-utils,
  pkg-config,
  sdformat,
  sdformat14,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-sensors8";
  version = "8.2.2";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sensors";
    tag = "gz-sensors8_8.2.2";
    hash = "sha256-TRDMCMesJXVSVGA3bnRngtXTi4VVf0y12AJQ79EEMiI=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-common
    gz-common5
    gz-math
    gz-math7
    gz-msgs
    gz-msgs10
    gz-plugin
    gz-rendering
    gz-rendering8
    gz-tools
    gz-tools2
    gz-transport
    gz-transport13
    gz-utils
    sdformat
    sdformat14
  ];
  checkInputs = [
    xorg.xorgserver
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Sensors : Sensor models for simulation";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-sensors";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
