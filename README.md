# mbp-manjaro

This repository contains the build scripts for compiling isos using the mbp-manjaro-kernel. With these iso files you can run Manjaro on 2018+ Macbook models with the T2 Chip.

Kernel Source: https://github.com/JPyke3/mbp-manjaro-kernel

Extra Modules: https://github.com/JPyke3/extramodules-mbp-manjaro

Repository: https://jacobpyke.xyz/archlinux/

**NOTE: The old repository was on port 8080, this is no longer how I want to move forward and this repo will soon be taken down and off this port. The repo will remain up until the 31st of july, this should give people enough time to switch to the new repo.**

In order to switch to the new repository run this in a terminal:
```
sudo sed -i 's/http:\/\/jacobpyke.xyz:8080/https:\/\/jacobpyke.xyz/' /etc/pacman.conf
```

All Drivers/Patches Featured:

* Keyboard, Trackpad, Audio and Suspend: https://github.com/MCMrARM/mbp2018-bridge-drv
* Arch Linux Kernel Patches: https://github.com/aunali1/linux-mbp-arch
* DKMS Module for loading Patches: https://github.com/aunali1/apple-bce-arch

## Releases

[Download the latest releases here](https://drive.google.com/drive/folders/16BK16Ig2BX3MzktFFPaX04-B2PTAhd8R?usp=sharing)

## Installation Proccess
Flash your iso to a USB Stick, If you want a easy way to do this. Use [Balena Etcher](https://www.balena.io/etcher/). For a more command line way of doing this, use dd.

#### Hardware requirements: 
* USB-C to ethernet cable adapter.
  * Whilst you can install this over WiFi, it would make it alot easier to use an Adapter. If you would like to use the WiFi to set up Manjaro then refer to the "In order to get WiFi working" Section after you have booted Manjaro
* USB-C to USB Adapter

### Steps
1. Partition your drive in MacOS ready for a linux install. You can either use Disk Utility or use Bootcamp, important thing is, is that you have two partitions (Your MacOS partition and your new linux one) (It isn't recommended that you totally delete MacOS as firmware updates are applied through it).
2. Take ISO and flash to a USB stick
3. Disable MacOS secure boot. [Apple's Documentation](https://support.apple.com/en-au/HT208330)

   a. Turn on your Mac, then press and hold Command (⌘)-R immediately after you see the Apple logo to start up from macOS Recovery.  
  
   b. When you see the macOS Utilities window, choose Utilities > Startup Security Utility from the menu bar.
  
   c. When you're asked to authenticate, click Enter macOS Password, then choose an administrator account and enter its password.
  
   d. Set the first option to "No Security", and the second to "Allow booting from External Media".
  
   e. Reboot your Mac.
  
4. Hold the option key whilst booting. 
5. Select the yellow EFI System using the arrow keys and hit enter.
5. When the USB menu first appears, use your arrows to go to the blank option below Boot and type in the following (Keep in mind you cannot use backspace here):
```
efi=noruntime
```
6. Hit enter scroll to boot and boot Manjaro.
7. After booting into Manjaro, set the system time using the Manjaro settings
8. Open the installer and proceed normally until you hit the partitioning stage
9. Click Manual Partitioning
10. Click on /dev/nvme0n1p1 then click edit at the bottom of the install window theen change the Change the Mount Point: /boot, after that click okay.
11. Usually, the MacOS partition is mounted to /dev/nvme0n1p2, ignore this partition
13. Delete your Linux partition on /dev/nvme0n1p3.
14. Create a 51200 MiB partition with ext4 as the file system. Change the mount point to / and click okay.
15. Use the remaining disk space to create an ext4 file system. Change the mount point to /home
16. Click Next, on the next screen a warning will appear about EFI System Partition Configuration. Just ignore it and click okay.
17. Continue the rest of the setup as normal. Once the installer has finished do not restart the system. 
18. Open a terminal, and type: 
```
sudo fdisk -l. 
```
The root password is 'manjaro'

19. Scroll up to the disk named /dev/nvme0n1. Note down the names of the 50G Linux partition and the 300M EFI SYSTEM partition.
In my case these were mounted at /dev/nvme0n1p1 (EFI System) and /dev/nvme0n1p3 (Linux Filesystem).
20. Copy this command into a terminal, substitute the two fields in { } with your EFI System and Linux Filesystem names
```
sudo mount {Linux Filesystem} /mnt; sudo mount {EFI System} /mnt/boot
```
21. Run this command, take note of the UUID
```
cat /mnt/etc/fstab | grep "/ "
```
22. Open a new terminal, and run this command
```
manjaro-chroot /mnt
```
23. Run this command to install systemd-boot
```
bootctl --path=/boot --no-variables install 
```
24. and then this one to mask systemd from not touching a EFI var (Causes a kernel panic)
```
systemctl mask systemd-boot-system-token.service 
```
25. Open the file /boot/loader/entries/manjaro.conf in your favorite text editor (If you are a beginner use the command below)
```
nano /boot/loader/entries/manjaro.conf
```
26. Paste in the block of text below (Note for beginners to paste into a terminal its usually control + shift + v)
```
title   Manjaro Linux
linux   /vmlinuz-5.6-x86_64-mbp
initrd  /intel-ucode.img
initrd  /initramfs-5.6-x86_64-mbp.img
options root="UUID={change_this_value}" rw
```
27. Change back to your other terminal with the values, And copy the UUID from the other terminal, replacing {change_this_value} (Including the brackets). 
28. Save the file (Use ctrl+x if you copied my command from above, press the y button and then press enter).
29. Run the command below:
```
echo -e 'default manjaro.conf\rtimeout 4\rconsole-mode max\reditor no'  > /boot/loader/loader.conf
```
30. Press control + d
31. Run this command:
```
sudo umount -R /mnt
```

Reboot your computer, Remembering to move the USB boot flash drive, and welcome to Manjaro :)

#### Footnote - Touchbar & AUDIO

Small Footnote to the install setup. At this stage I forgot to compile the ISO images with the images to include the touchbar & audio package, this will be fixed upon next release. In the meantime run this on your new system to get your touchbar and audio working:

```
sudo pacman -S macbook12-spi-driver-dkms audio-fix-mbp
```
then reboot.

## In order to get WiFi working
1. Boot into OSX and run the following in terminal: `ioreg -l | grep C-4364`

It will show something like:
```
"RequestedFiles" = ({"Firmware"="C-4364__s-B2/kauai.trx","TxCap"="C-4364__s-B2/kauai-X3.txcb","Regulatory"="C-4364__s-B2/kauai-X3.clmb","NVRAM"="C-4364__s-B2/P-kauai-X3_M-HRPN_V-u__m-7.5.txt"})

    | |   |         |       "images" = {"C-4364__s-B2/kauai-X3.txcb"={"imagetype"="TxCap","required"=No,"imagename"="C-4364__s-B2/kauai-X3.txcb"},"C-4364__s-B2/P-kauai-X3_M-HRPN_V-u__m-7.5.txt"={"imagetype"="NVRAM","required"=Yes,"imagename"="C-4364__s-B2/P-kauai-X3_M-HRPN_V-u__m-7.5.txt"},"C-4364__s-B2/kauai-X3.clmb"={"imagetype"="Regulatory","required"=Yes,"imagename"="C-4364__s-B2/kauai-X3.clmb"},"C-4364__s-B2/kauai.trx"={"imagetype"="Firmware","required"=Yes,"imagename"="C-4364__s-B2/kauai.trx"}}
```
It'll be different depending on your exact model.

2. There are three files to note down. A `.trx` (for me: `C-4364__s-B2/kauai.trx`), a `.clmb` (for me: `C-4364__s-B2/kauai-X3.clmb` and a `.txt` (for me: `C-4364__s-B2/P-kauai-X3_M-HRPN_V-u__m-7.5.txt`
3. Look for the corrisponding files in this repository: https://packages.aunali1.com/apple/wifi-fw/18G2022/ (Thank you Aunali1)
4. Boot back into linux and place the files in the following locations:
5. Copy the trx to `/lib/firmware/brcm/brcmfmac4364-pcie.bin` (e.g. `sudo cp kauai.trx /lib/firmware/brcm/brcmfmac4364-pcie.bin`)
6. The clmb to `/lib/firmware/brcm/brcmfmac4364-pcie.clm_blob` (e.g. `sudo cp kauai-X3.clmb /lib/firmware/brcm/brcmfmac4364-pcie.clm_blob`)
7. The txt to something like `/lib/firmware/brcm/brcmfmac4364-pcie.Apple Inc.-MacBookPro15,1.txt`. You will need to replace `15,1` with your model number. (e.g. `sudo cp P-kauai-X3_M-HRPN_V-u__m-7.5.txt /lib/firmware/brcm/brcmfmac4364-pcie.Apple Inc.-MacBookPro15,1.txt`).

   a. [Identifying your MacBook Pro Model](https://support.apple.com/en-us/HT201300) or [Identifying your MacBook Air Model](https://support.apple.com/en-au/HT201862)

- Credit to [@mikeeq](https://github.com/mikeeq) for the write up.

#### Footnote - WiFi using iwd (Recommended!)
The way I recommend getting WiFi to work in linux is using iwd instead of wpa_supplicant. Below is how you would configure iwd.
```
sudo pacman -S iwd
systemctl stop wpa_supplicant
systemctl mask wpa_supplicant
sudo nano /etc/NetworkManager/NetworkManager.conf
```
paste in this at the end:
```
[device]
wifi.backend=iwd
```
Run:
```
systemctl enable iwd
```
then reboot.

#### Footnote - WiFi using wpa_supplicant
In the next release this will not be required, but in order to have the wifi work after reboot run the following commands (NOTE: This is a bit tempremental as wpa_supplicant really doesn't work that well with the chips in the MacBooks):
```
sudo pacman -S wifi-fix-mbp
systemctl start wifi-fix.service; systemctl enable wifi-fix.service
```

## FAQ
#### Issues Updating Because of the MBP Repository
When you update the system, you may recieve errors about my key being corrupted, if that occurs open a terminal and run this
```
sudo pacman-key --recv-key 2BA2DFA128BBD111034F7626C7833DB15753380A --keyserver keyserver.ubuntu.com
```

#### When I click on the EFI Partition I boot into MacOS!

Yes, sadly I made a mistake in the very early builds. This is because the earlier builds used a different naming scheme before i adopted the manjaro standard of naming the kernel `linuxXX-mbp` 

In order to fix this fire up the live usb again. Once you boot into manjaro mount your EFI partition mount `/dev/nvme0n1p1 /mnt` edit the file `nano /mnt/loader/entries/manjaro.conf` and chane the line:
```
linux   /vmlinuz-linux56-mbp
```
to
```
linux   /vmlinuz-5.6-x86_64-mbp
```
and also change line:
```
initrd  /initramfs-linux56-mbp.img
```
to
```
initrd  /initramfs-5.6-x86_64-mbp.img
```
After that try the EFI System partition again.

**Note, after your first update with pacman the kernel will revert back to the old names, in order to ensure you still get the latest updates revert these lines back after runing sudo pacman -Syu once.**

#### Switch Touchbar to Function Keys
Run this in your terminal:
```
sudo bash -c "echo 2 > /sys/class/input/*/device/fnmode"
```

## Building for yourself

### Option 1: Docker
First, you need to ensure that docker isn't using `overlay` or `overlay2` filesystems. This can be verified by running `docker info`. And will be shown next to `Storage Driver`.

In the event that you are running `overlay`, [Look at this docker documentation](https://docs.docker.com/storage/storagedriver/aufs-driver/) on how to switch to AUFS.

**Quick Docker Install Script - Tested on Arch**
```
sh -c "$(curl -fsSL "https://raw.githubusercontent.com/JPyke3/mbp-manjaro/master/build-in-docker.sh")"
```

**Docker Command**

```
docker run --privileged \
          -v ~/manjaro-mbp-iso:/root/out \
          --env KERNEL=linux57-mbp\
          --env EDITION=gnome\
          jpyke3/mbp-manjaro-buildiso
```

#### Command Breakdown
 - `--privileged`
   - This is required for allowing the filesystems to be created. (This is a security risk! Read for yourself the documentation on this flag)
 - `-v`
   - Create a folder on your host filesystem to retrieve the compiled files from the container
 - `--env`
   - There are two environment variables:
     - `KERNEL`: This is used for defining which kernel version to use. All packages will follow the `-mbp` naming scheme.
     - `EDITION`: This is used for defining which edition of manjaro you would like to install.


## Option 2: Manually on an existing Manjaro Install

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
  - [x] xfce
  - [x] GNOME
  - [ ] KDE-Plasma
  - [ ] Cinnamon
  - [ ] Budige
