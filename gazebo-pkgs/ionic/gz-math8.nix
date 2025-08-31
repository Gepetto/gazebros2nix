{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  eigen,
  gz-cmake,
  gz-utils,
  gz-utils3,
  pkg-config,
  python3Packages,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-math8";
  version = "8.2.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-math";
    tag = "gz-math8_8.2.0";
    hash = "sha256-UpwgQrQrFuBe/ls9HtZy+UgO8b2ObHLCmCS6epEwOPo=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    eigen
    gz-cmake
    gz-utils
    gz-utils3
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
