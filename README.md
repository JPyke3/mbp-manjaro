# mbp-manjaro

This repository contains the build scripts for compiling isos using the mbp-manjaro-kernel. With these iso files you can run Manjaro on 2018+ Macbook models with the T2 Chip.

Kernel Source: https://github.com/JPyke3/mbp-manjaro-kernel

Extra Modules: https://github.com/JPyke3/extramodules-mbp-manjaro

Repository: http://jacobpyke.xyz:8080/archlinux/

All Drivers/Patches Featured:

* Keyboard, Trackpad, Audio and Suspend: https://github.com/MCMrARM/mbp2018-bridge-drv
* Arch Linux Kernel Patches: https://github.com/aunali1/linux-mbp-arch
* DKMS Module for loading Patches: https://github.com/aunali1/apple-bce-arch
* Most Recent WiFi Patch: https://github.com/mikeeq/mbp-fedora-kernel

## Releases

[Download the latest releases here](https://drive.google.com/drive/folders/16BK16Ig2BX3MzktFFPaX04-B2PTAhd8R?usp=sharing)

## Installation Proccess
Flash your iso to a USB Stick, If you want a easy way to do this. Use [Balena Etcher](https://www.balena.io/etcher/). For a more command line way of doing this, use dd.

**More In-Depth Installation Steps Coming Soon, in the meantime consult [mbp-fedora](https://github.com/mikeeq/mbp-fedora) Specifically Regarding Bootloader, and WiFi**

## Building for yourself

First Install Manjaro Tools:
```
pamac install manjaro-tools-iso git
```

Clone the repository to your home directory
```
git clone https://github.com/JPyke3/mbp-manjaro ~/iso-profiles
```
run a command corrisponding to your preferred version of Manjaro:
##### xfce
```
buildiso -f -p xfce -k linux56-mbp
```
##### GNOME
```
buildiso -f -p gnome -k linux56-mbp
```
##### KDE-Plasma
```
buildiso -f -p kde -k linux56-mbp
```
##### i3wm
```
buildiso -f -p i3 -k linux56-mbp
```
##### Cinnamon
```
buildiso -f -p cinnamon -k linux56-mbp
```
##### Budgie
```
buildiso -f -p budgie -k linux56-mbp
```

#### File Locations 
Navigate to the directory for your iso file. If Using xfce GNOME or KDE go to:
```
cd /var/cache/manjaro-tools/iso/manjaro/{NAME_OF_EDITION}/20.0.3/
```
If on i3wm Cinnamon or Budige navigate to:
```
cd /var/cache/manjaro-tools/iso/community/{NAME_OF_EDITION}/20.0.3/
```

## Notable Resources
Build Manjaro ISOs with Buildiso: https://wiki.manjaro.org/Build_Manjaro_ISOs_with_buildiso

Apple BCE DKMS Git: https://aur.archlinux.org/packages/apple-bce-dkms-git/

Manjaro Core Packages: https://gitlab.manjaro.org/packages/core

2018+ MBP Discord Server: https://discord.gg/fgDd8Vr

Arch MBP 2018 (Out of Date): https://gist.github.com/TRPB/437f663b545d23cc8a2073253c774be3

## Noteworthy Helpers
* Aunali1 (Arch Linux MBP and DKMS Modules): https://github.com/aunali1
* MCMrARM (Original Drivers): https://github.com/MCMrARM
* mikeeq (Fedora Linux MBP): https://github.com/mikeeq
* TRPB (Original Arch Linux Guide): https://github.com/TRPB
* marcosfad (Ubuntu MBP): https://github.com/marcosfad

## Other MBP Distributions
* Ubuntu: https://github.com/marcosfad/mbp-ubuntu
* Fedora: https://github.com/mikeeq/mbp-fedora
* Arch: https://github.com/aunali1/linux-mbp-arch

## TODO
- [ ] Fix KDE and Budgie Versions
- [ ] Automate WiFi Installation
- [ ] Test Installer on Every Edition
  - [ ] xfce
  - [ ] GNOME
  - [ ] KDE-Plasma
  - [ ] Cinnamon
  - [ ] Budige
