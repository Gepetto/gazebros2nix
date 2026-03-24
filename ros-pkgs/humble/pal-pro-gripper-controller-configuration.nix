{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  controller-manager,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  launch-ros,
  pal-pro-gripper-wrapper,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-pro-gripper-controller-configuration";
  version = "1.11.5";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_pro_gripper";
    tag = version;
    hash = "sha256-cvPOdGp7sZYHLKH54vvSrviqWZ2DOL1uX0M7mFrKKbY=";
  };
  sourceRoot = "source/pal_pro_gripper_controller_configuration";

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
    joint-state-broadcaster
    joint-trajectory-controller
    launch
    launch-pal
    launch-ros
    pal-pro-gripper-wrapper
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "The pal_pro_gripper_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_pro_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
