{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs

  # propagatedBuildInputs
  ament-index-python,
  controller-manager,
  controller-manager-msgs,
  lifecycle-msgs,
  python-qt-binding,
  qt-gui,
  rcl-interfaces,
  rclpy,
  ros2service,
  rqt-gui,
  rqt-gui-py,

  # checkInputs
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  python3Packages,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-rqt-controller-manager";
  version = "4.49.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-wb3s95kNsBvMB3eT1NeuUEnjg612k13nkC4BqZ1h7K4=";
  };
  sourceRoot = "source/rqt_controller_manager";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    ament-index-python
    controller-manager
    controller-manager-msgs
    lifecycle-msgs
    python-qt-binding
    qt-gui
    rcl-interfaces
    rclpy
    ros2service
    rqt-gui
    rqt-gui-py
  ];
  checkInputs = [
    launch
    launch-ros
    launch-testing
    launch-testing-ros
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Graphical frontend for interacting with the controller manager.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
