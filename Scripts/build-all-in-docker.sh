#!/bin/bash

# docker run --privileged  --mount type=bind,source="$HOME"/manjaro-mbp-iso,target=/root/out \
#          -v ~/tmp/buildiso:/var/lib/manjaro-tools/buildiso --env KERNEL=linux57-mbp\
#          --env EDITION=gnome\
#          jpyke3/mbp-manjaro-buildiso

for f in ../manjaro/*; do
    if [ -d "$f" ]; then
        e=$(echo -e "$f" | sed 's/\.\.\/manjaro\///')
        # Make out directory
        mkdir -p ~/mbp-manjaro/out/"$e"
        # Run the container
        docker run --privileged -v ~/mbp-manjaro/out/"$e":/root/out --env KERNEL=linux57-mbp --env EDITION="$e" jpyke3/mbp-manjaro-buildiso
        # Clean docker system
        docker system prune -f
    fi
done

for f in ../community/*; do
    if [ -d "$f" ]; then
        e=$(echo -e "$f" | sed 's/\.\.\/community\///')
        # Make out directory
        mkdir -p ~/mbp-manjaro/out/"$e"
        # Run the container
        docker run --privileged -v ~/mbp-manjaro/out/"$e":/root/out --env KERNEL=linux57-mbp --env EDITION="$e" jpyke3/mbp-manjaro-buildiso
        # Clean docker system
        docker system prune -f
    fi
done
