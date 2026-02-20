{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  ign-cmake,
  ign-math,
  ign-tools,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  tinyxml-2,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-msgs8";
  version = "8.7.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-msgs";
    tag = "ignition-msgs8_8.7.1";
    hash = "sha256-SgB4JvDR/isKzvZrGxML6Si0LYbeoRQ3LP7FAMlo4V0=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    ign-cmake
    ign-math
    ign-tools
    ign-tools
    protobuf
    python3
    python3Packages.protobuf
    tinyxml-2
  ];
  checkInputs = [
    python3Packages.pytest
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo Messages: Protobuf messages and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
