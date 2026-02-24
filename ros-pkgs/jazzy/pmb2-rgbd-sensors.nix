{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  catkin,

  # buildInputs

  # propagatedBuildInputs
  openni2-launch,
  pal-orbbec-openni2,
  pal-pcl,
  pal-usb-utils,
  uvc-camera,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-pmb2-rgbd-sensors";
  version = "2.0.8";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pmb2_navigation";
    rev = "4e15ad3bcc6d0df4df752ee8837bfec949c25e46";
    hash = "sha256-ZxwVosoaWIHL4+DRv80IBY53BXV6RuO6KKmysHIlNuU=";
  };
  sourceRoot = "source/pmb2_rgbd_sensors";

  buildType = "catkin";

  nativeBuildInputs = [
    catkin
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    openni2-launch
    pal-orbbec-openni2
    pal-pcl
    pal-usb-utils
    uvc-camera
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "PMB2-specific RGBD sensors launch and config files.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pmb2_navigation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
