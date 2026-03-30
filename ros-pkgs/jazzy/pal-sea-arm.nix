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
  pname = "ros-jazzy-pal-sea-arm";
  version = "1.24.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "pal_sea_arm";
    rev = "3d02055a3dbe751184c72ef93dfa539b18140246";
    hash = "sha256-8F38x0jq06DaicuF08jNuawFkD2oKQ5ZegLVuf/AFHQ=";
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
    homepage = "https://github.com/Tiago-Pro-Harmonic/pal_sea_arm";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
