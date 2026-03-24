{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  controller-manager,
  joint-trajectory-controller,
  launch,
  launch-pal,
  pal-pro-gripper-controller-configuration,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-sea-arm-controller-configuration";
  version = "1.25.0";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_sea_arm";
    tag = version;
    hash = "sha256-j42FZUWPmE9IU0sm4on9G+jXMr3e0tY9L1apIdi/SiQ=";
  };
  sourceRoot = "source/pal_sea_arm_controller_configuration";

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
    controller-manager
    joint-trajectory-controller
    launch
    launch-pal
    pal-pro-gripper-controller-configuration
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "The pal_sea_arm_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_sea_arm";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
