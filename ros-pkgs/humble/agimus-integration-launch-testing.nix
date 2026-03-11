{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  launch-testing,
  xmllintPackageHook,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-integration-launch-testing";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "f86c1247e95d06dac4d46d8d799290463e8c2651";
    hash = "sha256-jPphQtp89HZMVdUfLi06cbMUhO8bCcXUquRD6OujJao=";
  };
  sourceRoot = "source/agimus_integration_launch_testing";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    launch-testing
    xmllintPackageHook
  ];

  doCheck = true;

  meta = {
    description = "fork of integration_launch_testing for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
