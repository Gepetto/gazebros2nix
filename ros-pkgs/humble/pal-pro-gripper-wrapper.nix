{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-python,

  # buildInputs
  rclpy,
  sensor-msgs,
  trajectory-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-lint-auto,
  ament-lint-common,
  ament-pep257,
  python3Packages,
}:
buildRosPackage rec {
  pname = "ros-humble-pal-pro-gripper-wrapper";
  version = "1.11.3";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_pro_gripper";
    tag = version;
    hash = "sha256-fAkXqNQeKPv+/zUKVwzzaEXuQooDZV6Ley8Bw2yJf2Q=";
  };
  sourceRoot = "source/pal_pro_gripper_wrapper";

  buildType = "ament_python";

  nativeBuildInputs = [
    ament-cmake-python
  ];
  buildInputs = [
    rclpy
    sensor-msgs
    trajectory-msgs
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-lint-auto
    ament-lint-common
    ament-pep257
    python3Packages.pytest
  ];

  doCheck = true;

  meta = {
    description = "Grasp controller to close with a determined error on position only
    so to skip overheating.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_pro_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
