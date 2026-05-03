{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  pal-sea-arm-gazebo,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-sea-arm-simulation";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_sea_arm_simulation";
    tag = version;
    hash = "sha256-YBRNs2GhWgBsro0sSWW9Hk6Ckmlda+evfV2IwtYuY3g=";
  };
  sourceRoot = "source/pal_sea_arm_simulation";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
  ];
  propagatedBuildInputs = [
    pal-sea-arm-gazebo
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_sea_arm_simulation package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_sea_arm_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
