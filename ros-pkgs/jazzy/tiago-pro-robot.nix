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

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-robot";
  version = "1.36.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_robot";
    rev = "4dbe4b9877e97d93ac6cbc77155d4d811b5691b4";
    hash = "sha256-U49X5p7D4wnSmNUxDBLGRoTBvD1OCsMGUHXvLoAgBoM=";
  };
  sourceRoot = "source/tiago_pro_robot";

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
    tiago-pro-bringup
    tiago-pro-controller-configuration
    tiago-pro-description
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
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
