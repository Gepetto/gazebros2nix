{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs

  # propagatedBuildInputs
  control-msgs,
  controller-manager-msgs,
  python-qt-binding,
  python3Packages,
  qt-gui,
  rclpy,
  rqt-gui,
  rqt-gui-py,
  trajectory-msgs,

  # checkInputs
  launch-testing,
  launch-testing-ros,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-rqt-joint-trajectory-controller";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/rqt_joint_trajectory_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    control-msgs
    controller-manager-msgs
    python-qt-binding
    python3Packages.rospkg
    qt-gui
    rclpy
    rqt-gui
    rqt-gui-py
    trajectory-msgs
  ];
  checkInputs = [
    launch-testing
    launch-testing-ros
    python3Packages.pytest
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Graphical frontend for interacting with joint_trajectory_controller instances.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
