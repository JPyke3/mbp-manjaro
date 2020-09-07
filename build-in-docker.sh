#!/bin/bash
# Author: github.com/jpyke3 <Jacob Pyke, pyke.jacob1@gmail.com>

# The help screen
print_help() {
    echo "  Manjaro MBP Docker Build Scripts"
    echo ""
    echo "  Example Usage:"
    echo "  build-in-docker -k linux57 -p gnome"
    echo ""
    echo "  Arguments:"
    echo "      k       Specify which kernel version"
    echo "      p       Specify which manjaro edition (xfce, gnome, kde, i3, cinnamon, budgie)"
    echo "      h       Show this help file"
    exit 1
}

# Function to run the docker commands
run_docker() {
    
    # Make an out dir for the compiled ISO
    mkdir ~/manjaro-mbp-iso

    # Docker command
    docker run --privileged \
        -v ~/manjaro-mbp-iso:/root/out \
        jpyke3/mbp-manjaro-buildiso\
        buildiso -f\
        -p $EDITION\
        -k $KERNEL\
        -t /root/out
}

# Check to make sure docker is installed
if [ ! -f /bin/docker ]; then 
    echo "You need to install docker in order to run this script!"
    exit 1
fi

# Handle input flags
while getopts ":k:p:h:" opt; do
    # Read the options from the flags
    case $opt in
        k)
            KERNEL=$OPTARG
            ;;
        p)
            EDITION=$OPTARG
            ;;
        h)
            print_help
            ;;
        :)
            if [ $OPTARG == "h" ]; then
                print_help
            else
                echo "Option -$OPTARG requires an argument!"
                exit 1
            fi
            ;;
    esac
done

# Check if the two environment variables are set
if [ ! -z "$KERNEL" ] && [ ! -z "$EDITION" ]; then
    run_docker
else
    echo "You need to run this script with a Kernel Argument and an Edition"
    echo "For more information use the -h flag for help"
    exit 1
fi

