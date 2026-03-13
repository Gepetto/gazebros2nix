{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  ament-cmake-auto,

  # propagatedBuildInputs

  # checkInputs
  ament-lint-auto,
  ament-lint-common,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-br2-gazebo-worlds";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "br2_gazebo_worlds";
    rev = "2cbf955d3da970291fbc6ab6159a36282b52fe59";
    hash = "sha256-ehRDdpvV+/hK/fVbdzd4RpYLu5vbgzQcFhvkWSVL/jg=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "Simulation worlds for Book ROS 2.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/br2_gazebo_worlds";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
