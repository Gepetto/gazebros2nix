{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  curl,
  gflags,
  ign-cmake,
  ign-common,
  ign-math,
  ign-msgs,
  ign-tools,
  ign-utils,
  jsoncpp,
  libyaml,
  libzip,
  pkg-config,
  tinyxml-2,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-fuel-tools7";
  version = "7.3.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-fuel-tools";
    tag = "ignition-fuel-tools7_7.3.1";
    hash = "sha256-q5fH6g9jOZpVA4PTdvF1/nMejpcZVuPV19J2oPBVdSU=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    curl
    gflags
    ign-cmake
    ign-common
    ign-common
    ign-math
    ign-math
    ign-msgs
    ign-msgs
    ign-tools
    ign-tools
    ign-utils
    jsoncpp
    libyaml
    libzip
    tinyxml-2
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Fuel Tools: Classes and tools for interacting with Gazebo Fuel";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-fuel-tools";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
