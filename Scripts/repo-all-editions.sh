#!/bin/bash

for f in ../manjaro; do
    if [ -d "$f" ]; then
        cp user-repos.conf ../manjaro/"$f"
    fi
done
