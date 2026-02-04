{
  lib,
  stdenv,
  fetchFromGitHub,

  cli11,
  cmake,
  gz-cmake,
  pkg-config,
  spdlog,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-utils4";
  version = "4.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-utils";
    tag = "gz-utils4_4.0.0";
    hash = "sha256-fZonC/o5CNHdK/R3IgEoo1llehy36MwvXPQCgFnP8Ls=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    cli11
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
