{
  lib,
  stdenv,

  src-agimus-msgs,

  # nativeBuildInputs
  cmake,
  eigen,
  python3Packages,
  ament-cmake,
  rosidl-default-generators,

  # propagatedBuildInputs
  rosidl-typesupport-c,
  rosidl-typesupport-introspection-c,
  rosidl-runtime-py,
  sensor-msgs,
  std-msgs,
}:
stdenv.mkDerivation {
  pname = "agimus-msgs";
  version = "0.0.2";

  src = src-agimus-msgs;

  nativeBuildInputs = [
    cmake
    eigen
    python3Packages.python
    ament-cmake
    rosidl-default-generators
  ];

  propagatedBuildInputs = [
    rosidl-typesupport-c
    rosidl-typesupport-introspection-c
    rosidl-runtime-py
    sensor-msgs
    std-msgs
  ];

  doCheck = true;

  meta = {
    description = "ROS messages of the agimus-project.";
    homepage = "https://github.com/agimus-project/agimus-msgs";
    license = lib.licenses.bsd2;
    maintainers = [ lib.maintainers.nim65s ];
    platforms = lib.platforms.linux;
  };
}
