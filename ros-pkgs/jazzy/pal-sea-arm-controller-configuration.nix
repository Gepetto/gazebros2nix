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
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-sea-arm-controller-configuration";
  version = "1.24.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_sea_arm";
    rev = "8aaa9a7b51b3ce88ba64f581a71e7b02af3a1a10";
    hash = "sha256-aNtpnxqyTlfUjdAB74X1hLoDELSCz+y5kd19WRPJJfs=";
  };
  sourceRoot = "source/pal_sea_arm_controller_configuration";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
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

  doCheck = false;

  meta = {
    description = "The pal_sea_arm_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/pal_sea_arm";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
