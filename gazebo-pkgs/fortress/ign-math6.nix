{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  eigen,
  ign-cmake,
  ign-utils,
  pkg-config,
  python3Packages,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-math6";
  version = "6.15.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-math";
    tag = "ignition-math6_6.15.1";
    hash = "sha256-G6m7mg0xlnXknznLhFPbN/f80DUnWlFksfLAH6339Io=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    eigen
    ign-cmake
    ign-utils
  ];
  checkInputs = [
    python3Packages.pytest
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo Math : Math classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-math";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
