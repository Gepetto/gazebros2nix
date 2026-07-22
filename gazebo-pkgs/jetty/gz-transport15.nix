{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  cppzmq,
  gz-cmake,
  gz-math,
  gz-msgs,
  gz-tools,
  gz-tools2,
  gz-utils,
  libsodium,
  libzenohc-dev,
  libzenohcpp-dev,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  sqlite,
  util-linux,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-transport15";
  version = "15.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-transport";
    tag = "gz-transport15_15.1.0";
    hash = "sha256-a+PbuwTZ9zFRAJmnrbqmEpbecoetPat6LiAITP4sV2E=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    cppzmq
    gz-cmake
    gz-math
    gz-msgs
    gz-tools
    gz-tools2
    gz-utils
    libsodium
    libzenohc-dev
    libzenohcpp-dev
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
