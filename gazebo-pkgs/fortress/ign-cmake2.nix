{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-cmake2";
  version = "2.17.2";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-cmake";
    tag = "ignition-cmake2_2.17.2";
    hash = "sha256-aEEUPbh1MX0VYz53p0wQAKWIoXUgf9lGhc6q0JUX9Sg=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    cmake
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
