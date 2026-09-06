{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-core,
  ament-cmake-test,
  ament-cmake-vendor-package,
  cmake,

  # buildInputs
  cppzmq,
  gz-cmake-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-tools-vendor,
  gz-utils-vendor,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  sqlite,
  util-linux,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-lint-cmake,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-gz-transport-vendor";
  version = "0.0.9";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_transport_vendor";
    tag = version;
    hash = "sha256-FXcuLljrPVl/8hmUVtdOSCdlpH5ks2op8LZFAst3Bg4=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-core
    ament-cmake-test
    ament-cmake-vendor-package
    cmake
  ];
  buildInputs = [
    ament-cmake-core
    ament-cmake-test
    ament-cmake-vendor-package
    cmake
    cppzmq
    gz-cmake-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-tools-vendor
    gz-utils-vendor
    pkg-config
    protobuf
    python3
    python3Packages.psutil
    python3Packages.pybind11
    python3Packages.pytest
    sqlite
    util-linux
  ];
  propagatedBuildInputs = [
    cppzmq
    gz-cmake-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-tools-vendor
    gz-utils-vendor
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
    ament-cmake-copyright
    ament-cmake-lint-cmake
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-lint-cmake
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Vendor package for: gz-transport13 13.6.0

    Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_transport_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
