{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  pal-pro-gripper-controller-configuration,
  pal-pro-gripper-description,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-pro-gripper";
  version = "1.12.4";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_pro_gripper";
    tag = version;
    hash = "sha256-xyFjGXPZQSXAKtCl4Xy+T+BZwDawPbzfDIUfwaOfz+Y=";
  };
  sourceRoot = "source/pal_pro_gripper";

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
    pal-pro-gripper-controller-configuration
    pal-pro-gripper-description
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_pro_gripper package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_pro_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
