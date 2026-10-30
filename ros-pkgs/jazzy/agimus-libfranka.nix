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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka";
    rev = "9ede6fd418750b23b2824630575054aa7bbb876e";
    hash = "sha256-YrnJL8tWzX7ZkPzMza3Z4kw/f5kWhWOP+7Mrxqdd++c=";
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
    writableTmpDirAsHomeHook
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
