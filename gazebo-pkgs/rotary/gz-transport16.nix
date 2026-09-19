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
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-rotary-gz-transport16";
  version = "16.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-transport";
    tag = "gz-transport16_16.0.0-pre1";
    hash = "sha256-FqHWKoFHrRHAcEOjx6bo4aKpVv0EOYSo0DyS0N7eVIM=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    cppzmq
    gz-cmake
    gz-math
    gz-msgs
    gz-tools
    gz-utils
    libsodium
    libzenohc-dev
    libzenohcpp-dev
    protobuf
    python3Packages.psutil
    python3Packages.pybind11
    python3Packages.pytest
    sqlite
    util-linux
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    cppzmq
    gz-math
    gz-msgs
    gz-tools
    gz-utils
    libzenohc-dev
    libzenohcpp-dev
    pkg-config
    protobuf
    python3
    python3Packages.psutil
    python3Packages.pybind11
    python3Packages.pytest
    sqlite
    util-linux
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-transport";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
