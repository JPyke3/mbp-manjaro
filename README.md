# Manjaro for T2 MacBooks

This repository contains the build scripts for compiling isos using the mbp-manjaro-kernel. With these iso files you can run Manjaro on 2018+ Macbook models with the T2 Chip.

Kernel Source: https://github.com/JPyke3/mbp-manjaro-kernel

Extra Modules: https://github.com/JPyke3/extramodules-mbp-manjaro

Repository: http://mbp-repo.jacobpyke.xyz/archlinux/

Roadmap: https://github.com/JPyke3/mbp-manjaro/projects/1

## Important Notice for all users!

My repository has changed due to issues with my previous content delivery network. You can replace the repository by opening a terminal and running the following command:
```
sudo sed -i 's/https:\/\/jacobpyke.xyz/http:\/\/mbp-repo.jacobpyke.xyz/' /etc/pacman.conf
```

## Installation Proccess

[See the wiki for installation procedure](https://github.com/JPyke3/mbp-manjaro/wiki/Installation)

## Distro Specific Packages:
 - `audio-fix-mbp`
   - Installs files needed for pulseaudio rules
 - `wifi-fix-mbp`
   - Usage: `systemctl start wifi-fix.service; systemctl enable wifi-fix.service`
   - Fixes a bug where the wifi firmware won't load on boot

## FAQ

[See the wiki for a FAQ](https://github.com/JPyke3/mbp-manjaro/wiki/FAQ)

## Building for yourself

[See the wiki for build instructions](https://github.com/JPyke3/mbp-manjaro/wiki/Building)

## Notable Resources
* Build Manjaro ISOs with Buildiso: https://wiki.manjaro.org/Build_Manjaro_ISOs_with_buildiso
* Apple BCE DKMS Git: https://aur.archlinux.org/packages/apple-bce-dkms-git/
* Manjaro Core Packages: https://gitlab.manjaro.org/packages/core
* Linux on T2 Macs (2018+) Discord Server: https://discord.gg/fgDd8Vr
* Arch MBP 2018 (Out of Date): https://gist.github.com/TRPB/437f663b545d23cc8a2073253c774be3

## Noteworthy Helpers
* Aunali1 (Arch Linux MBP and DKMS Modules): https://github.com/aunali1
* MCMrARM (Original Drivers): https://github.com/MCMrARM
* mikeeq (Fedora Linux MBP): https://github.com/mikeeq
* TRPB (Original Arch Linux Guide): https://github.com/TRPB
* marcosfad (Ubuntu MBP): https://github.com/marcosfad

## Noteworthy GitHub Repo's
* Keyboard, Trackpad, Audio and Suspend: https://github.com/MCMrARM/mbp2018-bridge-drv
* Arch Linux Kernel Patches: https://github.com/aunali1/linux-mbp-arch
* DKMS Module for loading Patches: https://github.com/aunali1/apple-bce-arch

## Other MBP Distributions
* Ubuntu: https://github.com/marcosfad/mbp-ubuntu
* Fedora: https://github.com/mikeeq/mbp-fedora
* Arch: https://github.com/aunali1/linux-mbp-arch

# Donations
*There is absolutley no obligation to donate, this software is free and will remain that way, this is just if you wanna help support my caffeine addiction ☕️*

I accept donations either through Patreon (See the right hand side bar). Or via crypto (BTC and Lightning).

### On Chain
My On Chain address is: `36MMVwfxRyZKA4SJyUkB8QptMvBip9jLzS`

![btc-on-chain](https://s3.eu-central-1.wasabisys.com/mbp-repo.jacobpyke.xyz/images/btc-address.png)

### Lightning
[tippin.me](https://tippin.me) is currently not accepting sign ups, once they do I will create an account then I will accept tips via Lightning
