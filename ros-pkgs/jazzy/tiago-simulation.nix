{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  tiago-gazebo,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-simulation";
  version = "4.1.9";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_simulation";
    rev = "d35cb5a4d08daeb64d529569db0a645a9ceb1348";
    hash = "sha256-J5KnB9v6brqFooORlDUbqNc70UUP58r8W7skwuosqdY=";
  };
  sourceRoot = "source/tiago_simulation";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    tiago-gazebo
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The tiago_simulation package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
