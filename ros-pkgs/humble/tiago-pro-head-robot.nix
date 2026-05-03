{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  tiago-pro-head-bringup,
  tiago-pro-head-controller-configuration,
  tiago-pro-head-description,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-tiago-pro-head-robot";
  version = "1.10.0";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "tiago_pro_head_robot";
    tag = version;
    hash = "sha256-lMKtyKnAmqaSwZ8FGHkHVqMmU2uwylpt8yah75dc6io=";
  };
  sourceRoot = "source/tiago_pro_head_robot";

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
    tiago-pro-head-bringup
    tiago-pro-head-controller-configuration
    tiago-pro-head-description
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The tiago_pro_head_robot package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/tiago_pro_head_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
