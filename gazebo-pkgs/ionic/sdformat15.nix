{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-math,
  gz-math8,
  gz-tools,
  gz-tools2,
  gz-utils,
  gz-utils3,
  libxml2,
  pkg-config,
  python3Packages,
  tinyxml-2,
  urdfdom,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-sdformat15";
  version = "15.3.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "sdformat";
    tag = "sdformat15_15.3.0";
    hash = "sha256-5EGAypmWiUHvGpAXTIWJi8ChWkafK1li1C0/C1GIfkA=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-math
    gz-math8
    gz-tools
    gz-tools2
    gz-utils
    gz-utils3
    python3Packages.pybind11
    tinyxml-2
    urdfdom
  ];
  checkInputs = [
    libxml2
    python3Packages.psutil
    python3Packages.pytest
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "SDFormat is an XML file format that describes environments, objects, and robots
in a manner suitable for robotic applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/sdformat";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
