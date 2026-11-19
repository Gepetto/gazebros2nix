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
  pname = "ign-fortress-ign-transport11";
  version = "11.4.3";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-transport";
    tag = "ignition-transport11_11.4.3";
    hash = "sha256-1FWX9q1gz/Ud5AdJZ+Nja6TXJ+oD3mMHVEFKUkixiCo=";
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
    ign-cmake
    ign-math
    ign-msgs
    ign-tools
    ign-utils
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
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = false;

  meta = {
    description = "Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-transport";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
