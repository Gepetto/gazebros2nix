{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  pal-sea-arm-bringup,
  pal-sea-arm-controller-configuration,
  pal-sea-arm-description,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-sea-arm";
  version = "1.23.2";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_sea_arm";
    tag = version;
    hash = "sha256-8/N+vUzZFULRbKwE3nuqe4JDJ5O9KAM2jrQIPzkmVN0=";
  };
  sourceRoot = "source/pal_sea_arm";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    pal-sea-arm-bringup
    pal-sea-arm-controller-configuration
    pal-sea-arm-description
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_sea_arm package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_sea_arm";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
