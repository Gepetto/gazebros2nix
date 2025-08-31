{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  ign-cmake,
  ign-math,
  ign-tools,
  ign-utils,
  libxml2,
  pkg-config,
  python3Packages,
  tinyxml-2,
  urdfdom,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-sdformat12";
  version = "12.8.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "sdformat";
    tag = "sdformat12_12.8.0";
    hash = "sha256-jLomD1cY9Ki8+SXOYz+g7ddRQagaseoVMgU2HDxm490=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    ign-cmake
    ign-math
    ign-math
    ign-tools
    ign-tools
    ign-utils
    ign-utils
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
