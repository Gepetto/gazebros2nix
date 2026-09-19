{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-math,
  gz-tools,
  gz-utils,
  libxml2,
  pkg-config,
  python3,
  python3Packages,
  tinyxml-2,
  urdfdom,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-rotary-sdformat17";
  version = "17.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "sdformat";
    tag = "sdformat17_17.0.0-pre1";
    hash = "sha256-zt59adjHU1/CA9P3P9bLSDmM2K6JfVXXAT7FJFF1HmU=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-math
    gz-tools
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
  nativeCheckInputs = [
    gz-math
    gz-tools
    gz-utils
    python3Packages.pybind11
    tinyxml-2
    urdfdom
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = true;

  meta = {
    description = "SDFormat is an XML file format that describes environments, objects, and robots
in a manner suitable for robotic applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/sdformat";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
