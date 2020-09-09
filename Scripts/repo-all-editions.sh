#!/bin/bash

for f in ../manjaro; do
    if [ -d "$f" ]; then
        cp user-repos.conf ../manjaro/"$f"
    fi
done

for f in ../community; do
    if [ -d "$f" ]; then
        cp user-repos.conf ../manjaro/"$f"
    fi
done
