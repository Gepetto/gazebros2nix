{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  pkg-config,
  spdlog,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-utils3";
  version = "3.1.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-utils";
    tag = "gz-utils3_3.1.1";
    hash = "sha256-fYzysdB608jfMb/EbqiGD4hXmPxcaVTUrt9Wx0dBlto=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    spdlog
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo Utils : Classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-utils";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
