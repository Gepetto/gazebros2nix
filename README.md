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
```

## Known issues

### Freeimage

Gazebo depend on `freeimage`, which is not maintained and has a ton of CVE, so it is marked as insecure in nixpkgs.

Therefore in this repo we use `permittedInsecurePackages`.

We don't see any good solution to this issue, which has to be fixed in gazebo upstream

### Gazebo Classic

At least `tiago-pro-{gazebo,head-gazebo,description}` and `pal-sea-arm-gazebo` depend on at least `gazebo-plugins` which is a thing from Gazebo Classic. Gazebo Classic is EOL since January 2025, and all associated repositories are archived.

This repository still try to maintain it anyways for now, but that is a huge pain.

A better solution would be to update the packages that depend on Gazebo Classic by following the migration guides. Or to strip the packages from that dependency.

### Boost

Gazebo Classic depends on Boost Asio \< 1.87.

Therefore, in the repo we have a `boost = boost186;` in the overlay, which imply a ton of rebuilds. You should probably use a binary cache.

The good solution would be to get rid of Gazebo Classic. Another workaround would be to patch gazebo classic to update Boost Asio use to things that were so much obsolete that they finally got deleted.
