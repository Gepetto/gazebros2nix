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
  python3,
  sdformat,
  writableTmpDirAsHomeHook,
  xorg,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-sensors6";
  version = "6.10.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-sensors";
    tag = "ignition-sensors6_6.10.0";
    hash = "sha256-cVH4BwGOxZg8zIhBeJaB4NMaKwZMtIZeahPrZk45TZ4=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    ign-cmake
    ign-common
    ign-math
    ign-msgs
    ign-plugin
    ign-rendering
    ign-tools
    ign-transport
    ign-utils
    sdformat
  ];
  checkInputs = [
    xorg.xorgserver
  ];
  nativeCheckInputs = [
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
