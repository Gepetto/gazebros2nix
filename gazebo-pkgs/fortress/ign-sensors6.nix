{
  lib,
  stdenv,
  fetchFromGitHub,

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
  sdformat,
  xorg,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-sensors6";
  version = "6.8.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sensors";
    tag = "ignition-sensors6_6.8.1";
    hash = "sha256-H3VMyribtq2kSnhReD3R/RjWoFGFJ62+Ta5G+iN5lsg=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    ign-cmake
    ign-common
    ign-common
    ign-math
    ign-math
    ign-msgs
    ign-msgs
    ign-plugin
    ign-rendering
    ign-rendering
    ign-tools
    ign-tools
    ign-transport
    ign-transport
    ign-utils
    sdformat
    sdformat
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
