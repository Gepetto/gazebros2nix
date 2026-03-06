{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  tiago-pro-bringup,
  tiago-pro-controller-configuration,
  tiago-pro-description,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-robot";
  version = "1.36.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_robot";
    rev = "d835dc4d99ba9e6614f5cd232eafc7c243d4c79c";
    hash = "sha256-NRnr88i8S4dFRy5pp4G5UiC/CPlwuhJoJdM6Q75KW3Y=";
  };
  sourceRoot = "source/tiago_pro_robot";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    tiago-pro-bringup
    tiago-pro-controller-configuration
    tiago-pro-description
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The tiago_pro_robot package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
