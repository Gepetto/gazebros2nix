# Testing gazebo

## Fortress

```
nix shell .#gz-fortress --command ign gazebo --render-engine ogre gazebo-pkgs/old.sdf
```

## Harmonic

```
nix shell .#gz-harmonic --command gz sim gazebo-pkgs/building_robot.sdf
```

## Ionic

```
nix shell .#gz-ionic --command gz sim gazebo-pkgs/building_robot.sdf
```
