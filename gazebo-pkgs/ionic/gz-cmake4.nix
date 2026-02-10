{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-cmake4";
  version = "4.2.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-cmake";
    tag = "gz-cmake4_4.2.1";
    hash = "sha256-zhpZnvfnWsuyykIbNB4xgHxdO35otmaz0x/VXSdWPNY=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo CMake : CMake Modules for Gazebo Projects";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-cmake";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
