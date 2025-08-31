{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-tools,
  gz-tools2,
  gz-utils,
  gz-utils2,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-plugin2";
  version = "2.0.4";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-plugin";
    tag = "gz-plugin2_2.0.4";
    hash = "sha256-iL4+EdFFAU55FVqE/CvyTv1zNaXxBWqWx44L0BeG2MU=";
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
    gz-utils2
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
