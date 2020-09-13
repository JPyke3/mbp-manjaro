# Maintainer: github.com/JPyke3 <Jacob Pyke, pyke.jacob1@gmail.com>
# build-in-docker.sh

#!/bin/bash

for f in ../manjaro/*; do
    if [ -d "$f" ]; then
        e=$(echo -e "$f" | sed 's/\.\.\/manjaro\///')
        # Make out directory
        mkdir -p ~/mbp-manjaro/out/"$e"
        # Run the container
        docker run --privileged -v $PWD/../:/root/iso-profiles -v ~/mbp-manjaro/out/"$e":/root/out --env KERNEL=linux57-mbp --env EDITION="$e" jpyke3/mbp-manjaro-buildiso
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
        docker run --privileged -v $PWD/../:/root/iso-profiles -v ~/mbp-manjaro/out/"$e":/root/out --env KERNEL=linux57-mbp --env EDITION="$e" jpyke3/mbp-manjaro-buildiso
        # Clean docker system
        docker system prune -f
    fi
done
