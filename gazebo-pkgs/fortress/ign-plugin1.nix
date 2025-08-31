{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  ign-cmake,
  ign-tools,
  ign-utils,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-plugin1";
  version = "1.4.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-plugin";
    tag = "ignition-plugin_1.4.0";
    hash = "sha256-i5kmsyE+n171oW0CG4x3NcZCJ999F6LdSI3Rx8oPCIo=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    ign-cmake
    ign-tools
    ign-utils
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
