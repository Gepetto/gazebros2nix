final: prev: {
  rosPackages = prev.rosPackages // {
    # PAL alum: ROS humble but jazzy versions of ros control
    alum =
      (prev.rosPackages.humble.overrideScope (
        alum-final: _humble-prev:
        final.lib.filesystem.packagesFromDirectoryRecursive {
          inherit (alum-final) callPackage;
          directory = ./ros-pkgs/alum;
        }
      )).overrideScope
        (
          _alum-final: alum-prev: {
            control-msgs = alum-prev.control-msgs.overrideAttrs {
              cmakeFlags = [
                "-DCMAKE_SKIP_BUILD_RPATH=ON"
                "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
              ];
            };
            controller-manager-msgs = alum-prev.controller-manager-msgs.overrideAttrs {
              cmakeFlags = [
                "-DCMAKE_SKIP_BUILD_RPATH=ON"
                "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
              ];
            };
            sdformat-urdf = alum-prev.sdformat-urdf.overrideAttrs {
              # ref. https://github.com/ros/sdformat_urdf/pull/41
              postPatch = ''
                substituteInPlace CMakeLists.txt --replace-fail \
                  "find_package(urdfdom_headers 1.0.6 REQUIRED)" \
                  "find_package(urdfdom_headers REQUIRED)"
              '';
            };
          }
        );
  };
}
