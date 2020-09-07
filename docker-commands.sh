#!/bin/bash

git clone https://github.com/JPyke3/mbp-manjaro ~/iso-profiles

buildiso -f -p $EDITION -k $KERNEL -t /root/out
