{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  cppzmq,
  ign-cmake,
  ign-math,
  ign-msgs,
  ign-tools,
  ign-utils,
  libsodium,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  sqlite,
  util-linux,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-transport11";
  version = "11.4.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-transport";
    tag = "ignition-transport11_11.4.1";
    hash = "sha256-wQ/ugKYopWgSaa6tqPrp8oQexPpnA6fa28L383OGNXM=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    cppzmq
    ign-cmake
    ign-math
    ign-math
    ign-msgs
    ign-msgs
    ign-tools
    ign-tools
    ign-utils
    ign-utils
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
