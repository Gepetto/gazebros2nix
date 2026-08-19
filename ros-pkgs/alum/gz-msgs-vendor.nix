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
  gz-cmake-vendor,
  gz-math-vendor,
  gz-tools-vendor,
  protobuf,
  python3,
  python3Packages,
  tinyxml-2,

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
  pname = "ros-alum-gz-msgs-vendor";
  version = "0.0.7";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_msgs_vendor";
    tag = version;
    hash = "sha256-CIwiL+mHTj+WpfH+JTipklF9KmtgWpyz390GFrd74B4=";
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
    gz-cmake-vendor
    gz-math-vendor
    gz-tools-vendor
    protobuf
    python3
    python3Packages.protobuf
    tinyxml-2
  ];
  propagatedBuildInputs = [
    gz-cmake-vendor
    gz-math-vendor
    gz-tools-vendor
    protobuf
    python3
    python3Packages.protobuf
    tinyxml-2
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-lint-cmake
    ament-cmake-xmllint
    python3Packages.pytest
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
    description = "Vendor package for: gz-msgs10 10.4.0

    Gazebo Messages: Protobuf messages and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_msgs_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
