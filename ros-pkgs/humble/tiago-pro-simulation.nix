{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  tiago-pro-gazebo,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-humble-tiago-pro-simulation";
  version = "1.14.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "tiago_pro_simulation";
    tag = version;
    hash = "sha256-cjfTsCl/3OGPcYErw19zOXJUWxwXInHsicZTC93f5Hs=";
  };
  sourceRoot = "source/tiago_pro_simulation";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    tiago-pro-gazebo
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The tiago_pro_simulation package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/tiago_pro_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
