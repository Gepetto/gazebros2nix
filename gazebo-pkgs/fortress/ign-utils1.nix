{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  ign-cmake,
  pkg-config,
  spdlog,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-utils1";
  version = "1_1.5.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-utils";
    tag = "ignition-utils1_1.5.1";
    hash = "sha256-Ymlw1SBoSlHwxe/4E3jdMy8ECCFNy8YGboqTQi6UIs4=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    ign-cmake
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
