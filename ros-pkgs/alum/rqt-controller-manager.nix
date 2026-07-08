{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs

  # propagatedBuildInputs
  controller-manager,
  controller-manager-msgs,
  rclpy,
  rqt-gui,
  rqt-gui-py,

  # checkInputs
  launch-testing,
  launch-testing-ros,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-rqt-controller-manager";
  version = "4.46.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-e0Y8CCl8/B80fLOXOePbjn1QRxFEi60W2IGTBhM2Qg4=";
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
    controller-manager
    controller-manager-msgs
    rclpy
    rqt-gui
    rqt-gui-py
  ];
  checkInputs = [
    launch-testing
    launch-testing-ros
  ];
  nativeCheckInputs = [
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
