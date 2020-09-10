#!/bin/bash

# docker run --privileged  --mount type=bind,source="$HOME"/manjaro-mbp-iso,target=/root/out \
#          -v ~/tmp/buildiso:/var/lib/manjaro-tools/buildiso --env KERNEL=linux57-mbp\
#          --env EDITION=gnome\
#          jpyke3/mbp-manjaro-buildiso

for f in ../manjaro/*; do
    if [ -d "$f" ]; then
        # Make out directory
        mkdir -p ~/mbp-manjaro/out/"$f"
        # Make temp build dir
        mkdir -p ~/mbp-manjaro/tmp/"$f"
        # Run the container
        docker run --privileged -v ~/mbp-manjaro/out/"$f":/root/out ~/mbp-manjaro/tmp/"$f":/var/lib/manjaro-tools/buildiso --env KERNEL=linux57-mbp --env EDITION="$f" jpyke3/mbp-manjaro-buildiso
        # Remove temp build dir
        rm -rf ~/mbp-manjaro/tmp
    fi
done

for f in ../community/*; do
    if [ -d "$f" ]; then
        # Make out directory
        mkdir -p ~/mbp-manjaro/out/"$f"
        # Make temp build dir
        mkdir -p ~/mbp-manjaro/tmp/"$f"
        # Run the container
        docker run --privileged -v ~/mbp-manjaro/out/"$f":/root/out ~/mbp-manjaro/tmp/"$f":/var/lib/manjaro-tools/buildiso --env KERNEL=linux57-mbp --env EDITION="$f" jpyke3/mbp-manjaro-buildiso
        # Remove temp build dir
        rm -rf ~/mbp-manjaro/tmp
    fi
done
