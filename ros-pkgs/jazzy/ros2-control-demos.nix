{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  ros2-control-demo-example-1,
  ros2-control-demo-example-10,
  ros2-control-demo-example-11,
  ros2-control-demo-example-12,
  ros2-control-demo-example-13,
  ros2-control-demo-example-14,
  ros2-control-demo-example-15,
  ros2-control-demo-example-16,
  ros2-control-demo-example-17,
  ros2-control-demo-example-2,
  ros2-control-demo-example-3,
  ros2-control-demo-example-4,
  ros2-control-demo-example-5,
  ros2-control-demo-example-6,
  ros2-control-demo-example-7,
  ros2-control-demo-example-8,
  ros2-control-demo-example-9,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demos";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "39e4d423efbdeffb8b6a19da61308185146d8af5";
    hash = "sha256-26xN3DLDpPKmuJpQwg168ZXmi8PxnRyRAgpuEV5vpB8=";
  };
  sourceRoot = "source/ros2_control_demos";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    ros2-control-demo-example-1
    ros2-control-demo-example-10
    ros2-control-demo-example-11
    ros2-control-demo-example-12
    ros2-control-demo-example-13
    ros2-control-demo-example-14
    ros2-control-demo-example-15
    ros2-control-demo-example-16
    ros2-control-demo-example-17
    ros2-control-demo-example-2
    ros2-control-demo-example-3
    ros2-control-demo-example-4
    ros2-control-demo-example-5
    ros2-control-demo-example-6
    ros2-control-demo-example-7
    ros2-control-demo-example-8
    ros2-control-demo-example-9
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Metapackage for `ros2_control` demos packages";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
