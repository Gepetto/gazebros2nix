{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  cppzmq,
  gz-cmake,
  gz-math,
  gz-math7,
  gz-msgs,
  gz-msgs10,
  gz-tools,
  gz-tools2,
  gz-utils,
  gz-utils2,
  libsodium,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  sqlite,
  util-linux,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-transport13";
  version = "13.4.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-transport";
    tag = "gz-transport13_13.4.1";
    hash = "sha256-hCP+yVoyl1c3KNmQ5jKrYvPT1IlAy9JkCh0c0mOF+KM=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    cppzmq
    gz-cmake
    gz-math
    gz-math7
    gz-msgs
    gz-msgs10
    gz-tools
    gz-tools2
    gz-utils
    gz-utils2
    libsodium
    pkg-config
    protobuf
    python3
    python3Packages.psutil
    python3Packages.pybind11
    python3Packages.pytest
    sqlite
    util-linux
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-transport";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
