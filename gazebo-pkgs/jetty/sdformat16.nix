{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-math,
  gz-tools,
  gz-tools2,
  gz-utils,
  libxml2,
  pkg-config,
  python3Packages,
  tinyxml-2,
  urdfdom,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-sdformat16";
  version = "16.0.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "sdformat";
    tag = "sdformat16_16.0.1";
    hash = "sha256-WhbPVzlR8p89bqtzqGjfGJbTjOHjdlm7mMxhvyHmZjA=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-math
    gz-tools
    gz-tools2
    gz-utils
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
