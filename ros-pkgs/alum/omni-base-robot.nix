{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  omni-base-bringup,
  omni-base-controller-configuration,
  omni-base-description,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-omni-base-robot";
  version = "2.14.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "omni_base_robot";
    tag = version;
    hash = "sha256-wkyZUJ8bmBAAcl7VCeZ9aAz/HU3F/C22jYFkskfsw9I=";
  };
  sourceRoot = "source/omni_base_robot";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
    omni-base-bringup
    omni-base-controller-configuration
    omni-base-description
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "The omni_base_robot package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/omni_base_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
