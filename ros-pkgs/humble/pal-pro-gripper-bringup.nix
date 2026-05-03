{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  joint-state-broadcaster,
  joint-trajectory-controller,
  pal-pro-gripper-controller-configuration,
  pal-pro-gripper-description,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-pro-gripper-bringup";
  version = "1.12.4";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_pro_gripper";
    tag = version;
    hash = "sha256-xyFjGXPZQSXAKtCl4Xy+T+BZwDawPbzfDIUfwaOfz+Y=";
  };
  sourceRoot = "source/pal_pro_gripper_bringup";

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
    joint-state-broadcaster
    joint-trajectory-controller
    pal-pro-gripper-controller-configuration
    pal-pro-gripper-description
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Launch files to upload the robot description and start the controllers";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_pro_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
