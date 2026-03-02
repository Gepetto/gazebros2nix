# gazebros2nix

Generate and maintain Nix packages from gazebodistro & ROS package.xmls

## Usage

A `gazebros2nix` Python module provide `gazebo2nix` and `ros2nix` executables. Those will look respectively for `gazebo2nix.toml` and `ros2nix.toml` configuration files, and generate Nix packages with that.

This repository also have those configuration files and the corresponding generated packages, so that we can use those.

So you can either write your own config file to generate your own packages, or use those we maintain, or both :)

## Examples

```
nix shell .#gz-fortress --command ign gazebo --render-engine ogre tests/fortress.sdf
nix shell .#gz-harmonic --command gz sim tests/harmonic.sdf
nix shell .#gz-ionic    --command gz sim tests/ionic.sdf
nix shell .#gz-jetty    --command gz sim tests/ionic.sdf
nix shell .#ros-humble  --command ros2 launch agimus_demo_03_mpc_dummy_traj bringup.launch.py use_gazebo:=true use_rviz:=true gz_headless:=true
nix shell .#ros-jazzy   --command ros2 launch tiago_gazebo tiago_gazebo.launch.py is_public_sim:=True world_name:=empty
```

## Known issues

### Freeimage

OGRE & Gazebo depend on `freeimage`, which is not maintained and has a ton of CVE, so it is marked as insecure in nixpkgs.

Therefore in this repo we use `permittedInsecurePackages` and copy-paste packages from obsolete nixpkgs in the `garbage/` directory.

We don't see any good solution to this issue, which has to be fixed in OGRE & gazebo upstream.

### Gazebo Classic

At least `tiago-pro-{gazebo,head-gazebo,description}` and `pal-sea-arm-gazebo` depend on at least `gazebo-plugins` which is a thing from Gazebo Classic. Gazebo Classic is EOL since January 2025, and all associated repositories are archived.

This repository is not trying to maintain it anymore.
