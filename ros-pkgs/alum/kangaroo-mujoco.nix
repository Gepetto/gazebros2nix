{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  kangaroo-bringup,
  kangaroo-controller-configuration,
  kangaroo-description,
  launch,
  launch-pal,
  launch-ros,
  mujoco-ros2-control,
  rclpy,
  std-msgs,

  # checkInputs
  ament-cmake-pytest,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-kangaroo-mujoco";
  version = "2.6.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "kangaroo_simulation";
    tag = version;
    hash = "sha256-9p61humn6WCg5HC6k04sjwkqgW+th1ca5L07pfLhHeU=";
  };
  sourceRoot = "source/kangaroo_mujoco";

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
    kangaroo-bringup
    kangaroo-controller-configuration
    kangaroo-description
    launch
    launch-pal
    launch-ros
    mujoco-ros2-control
    rclpy
    std-msgs
  ];
  checkInputs = [
    ament-cmake-pytest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Kangaroo MuJoCo simulation package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/kangaroo_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
