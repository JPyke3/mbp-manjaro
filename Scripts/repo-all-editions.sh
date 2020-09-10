#!/bin/bash

for f in ../manjaro/*; do
    if [ -d "$f" ]; then
        ln -sf ../../user-repos.conf ../manjaro/"$f"/user-repos.conf 
    fi
done

for f in ../community/*; do
    if [ -d "$f" ]; then
        ln -sf ../../user-repos.conf ../community/"$f"/user-repos.conf 
    fi
done
