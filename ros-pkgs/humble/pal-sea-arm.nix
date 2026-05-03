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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-sea-arm";
  version = "2.2.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_sea_arm";
    tag = version;
    hash = "sha256-YRBsyTfPRW1U8Va9JRE5kCRKH5ok/f3gMFQ1kG2HDTw=";
  };
  sourceRoot = "source/pal_sea_arm";

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
    pal-sea-arm-bringup
    pal-sea-arm-controller-configuration
    pal-sea-arm-description
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
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
