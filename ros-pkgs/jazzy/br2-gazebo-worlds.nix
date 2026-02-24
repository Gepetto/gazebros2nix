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
}:
buildRosPackage rec {
  pname = "ros-jazzy-br2-gazebo-worlds";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "br2_gazebo_worlds";
    rev = "6e35a5bf13165d007eb478bbb9d4b6fe85303dab";
    hash = "sha256-I9JgmdCl2PKjhuvbyhOmIFqT2sXlHbmagIIaAcoMSoo=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Simulation worlds for Book ROS 2.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/br2_gazebo_worlds";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
