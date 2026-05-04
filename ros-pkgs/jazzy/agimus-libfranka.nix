{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,
  doxygen,

  # buildInputs
  poco,

  # propagatedBuildInputs
  agimus-libfranka-common,
  eigen,

  # checkInputs
  gtest,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka";
    rev = "fcc87638ebe79028a03111c3664cf92291f215a3";
    hash = "sha256-NCKmjA/EFn34POpeih6yIaqdozTHiF1h4LvjbQDYPeo=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
    doxygen
  ];
  buildInputs = [
    cmake
    poco
  ];
  propagatedBuildInputs = [
    agimus-libfranka-common
    eigen
    poco
  ];
  checkInputs = [
    gtest
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "fork of libagimus_franka for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-libfranka";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
