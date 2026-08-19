{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  catkin,

  # buildInputs
  ignition-gazebo2,
  ignition-rendering2,
  ignition-sensors2,
  roscpp,
  sensor-msgs,

  # propagatedBuildInputs
  message-runtime,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-ros-gz-point-cloud";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "ros_gz";
    tag = version;
    hash = "sha256-yf9iUOf/o7E0hK31bz8UUSzUp0TyrTeHHDTbJCJefXs=";
  };
  sourceRoot = "source/ros_gz_point_cloud";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "catkin";

  nativeBuildInputs = [
    catkin
  ];
  buildInputs = [
    ignition-gazebo2
    ignition-rendering2
    ignition-sensors2
    roscpp
    sensor-msgs
  ];
  propagatedBuildInputs = [
    ignition-gazebo2
    ignition-rendering2
    ignition-sensors2
    message-runtime
    roscpp
    sensor-msgs
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Point cloud utilities for Gazebo simulation with ROS.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/ros_gz";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
