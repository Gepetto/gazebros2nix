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
  pname = "ros-alum-gz-utils-vendor";
  version = "0.0.5";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_utils_vendor";
    tag = version;
    hash = "sha256-JDGjZPW0fqbfXE9aP9VBknxushfPM5s9XN+AampmARo=";
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
  ];
  propagatedBuildInputs = [
    gz-cmake-vendor
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
    description = "Vendor package for: gz-utils2 2.2.1

    Gazebo Utils : Classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_utils_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
