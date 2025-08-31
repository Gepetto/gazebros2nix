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
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  tinyxml-2,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-msgs11";
  version = "11.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-msgs";
    tag = "gz-msgs11_11.1.0";
    hash = "sha256-M/rzUrL6uzpaRNLWJsGViY6Jk0bLtooEe+0eEEPS7PA=";
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
    protobuf
    python3
    python3Packages.protobuf
    tinyxml-2
  ];
  checkInputs = [
    python3Packages.pytest
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Messages: Protobuf messages and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
