{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  tiago-pro-2dnav,
  tiago-pro-laser-sensors,
  tiago-pro-rgbd-sensors,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-humble-tiago-pro-navigation";
  version = "2.14.0";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "tiago_pro_navigation";
    tag = version;
    hash = "sha256-CWqmbPxE05r7TrQUAqXmk3gEK9QJYxhP9ROmifcQXHY=";
  };
  sourceRoot = "source/tiago_pro_navigation";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    tiago-pro-2dnav
    tiago-pro-laser-sensors
    tiago-pro-rgbd-sensors
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The tiago_pro Navigation metapackage";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/tiago_pro_navigation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
