{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-tools,
  gz-tools2,
  gz-utils,
  gz-utils3,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-plugin3";
  version = "3.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-plugin";
    tag = "gz-plugin3_3.1.0";
    hash = "sha256-3La9TqxljV1Lko6ju+b8CCspDbhXGPLOGMivqYElTXM=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-tools
    gz-tools2
    gz-utils
    gz-utils3
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Plugin : Cross-platform C++ library for dynamically loading plugins.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-plugin";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
