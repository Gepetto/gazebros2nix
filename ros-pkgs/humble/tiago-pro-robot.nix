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
  pname = "ros-humble-tiago-pro-robot";
  version = "1.35.3";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "tiago_pro_robot";
    tag = version;
    hash = "sha256-SIR9tIDNAn8hifFaClzDJBOjHIH5hUFcTtT1Kjht7D8=";
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
    homepage = "https://github.com/pal-robotics/tiago_pro_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
