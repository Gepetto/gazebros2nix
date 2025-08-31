{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-math,
  gz-math7,
  gz-tools,
  gz-tools2,
  gz-utils,
  gz-utils2,
  libxml2,
  pkg-config,
  python3Packages,
  tinyxml-2,
  urdfdom,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-sdformat14";
  version = "14.8.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "sdformat";
    tag = "sdformat14_14.8.0";
    hash = "sha256-jnOsO70Cnw106eY5FwKKf9U1fCEa2dZQfN58+SrqmdE=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-math
    gz-math7
    gz-tools
    gz-tools2
    gz-utils
    gz-utils2
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
