{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  cppzmq,
  gz-cmake,
  gz-math,
  gz-math8,
  gz-msgs,
  gz-msgs11,
  gz-tools,
  gz-tools2,
  gz-utils,
  gz-utils3,
  libsodium,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  sqlite,
  util-linux,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-transport14";
  version = "14.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-transport";
    tag = "gz-transport14_14.1.0";
    hash = "sha256-45jD5lwNDJRJw8TKxCVBifKJYZ+NZcygSJozrynbs9g=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    cppzmq
    gz-cmake
    gz-math
    gz-math8
    gz-msgs
    gz-msgs11
    gz-tools
    gz-tools2
    gz-utils
    gz-utils3
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
