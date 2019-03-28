iso-profiles
==========================

###### profile.conf

~~~
##########################################
###### use this file in the profile ######
##########################################

# use multilib packages; x86_64 only
# multilib="true"

# use extra packages as defined in pkglist to activate a full profile
# extra="false"

################ install ################

# default displaymanager: none
# supported; lightdm, sddm, gdm, lxdm, mdm
# displaymanager="none"

# Set to false to disable autologin in the livecd
# autologin="true"

# nonfree xorg drivers
# nonfree_mhwd="true"

# possible values: grub;systemd-boot
# efi_boot_loader="grub"

# configure calamares for netinstall
# netinstall="false"

# configure calamares to use chrootcfg instead of unpackfs; default: unpackfs
# chrootcfg="false"

# use geoip
# geoip="true"

# unset defaults to given values
# names must match systemd service names
# enable_systemd=('bluetooth' 'cronie' 'ModemManager' 'NetworkManager' 'org.cups.cupsd' 'tlp' 'tlp-sleep')
# disable_systemd=()

# unset defaults to given values,
# names must match openrc service names
# enable_openrc=('acpid' 'bluetooth' 'elogind' 'cronie' 'cupsd' 'dbus' 'syslog-ng' 'NetworkManager')
# disable_openrc=()

# unset defaults to given values
# addgroups="video,power,disk,storage,optical,network,lp,scanner,wheel"

# the same workgroup name if samba is used
# smb_workgroup="Manjaro"

################# live-session #################

# unset defaults to given value
# hostname="manjaro"

# unset defaults to given value
# username="manjaro"

# unset defaults to given value
# password="manjaro"

# the login shell
# defaults to bash
# login_shell=/bin/bash

# unset defaults to given values
# names must match systemd service names
# services in enable_systemd array don't need to be listed here
# enable_systemd_live=('manjaro-live' 'mhwd-live' 'pacman-init' 'mirrors-live')

# unset defaults to given values,
# names must match openrc service names
# services in enable_openrc array don't need to be listed here
# enable_openrc_live=('manjaro-live' 'mhwd-live' 'pacman-init' 'mirrors-live')
~~~

###### New Packagelist tags

~~~
>openrc
>systemd

>i686
>x86_64
>multilib

>nonfree_default
>nonfree_i686
>nonfree_x86_64
>nonfree_multilib

>manjaro

>basic
>extra
~~~

###### Packages-Root

* Contains root image packages
* ideally no xorg

###### Packages-Desktop

* Contains the desktop image packages
* desktop environment packages go here

###### Packages-Mhwd

* Contains the MHWD driver packages repo

###### Packages-Live

* Contains packages you only want in live session but not installed on the target system with installer
* default files are in shared folder and can be symlinked or defined in a real file

###### buildiso can be configured to use custom repos

* create a user-repos.conf

~~~
${profile_dir}/user-repos.conf
~~~

**Add only your repos to user-repos.conf!**

**Important**: Only online repos is allowed in the user-repos.conf. Buildiso will fail on file-based repos.


###### Calamares
* netgroups definitions go in [this](https://github.com/manjaro/calamares-netgroups) repo please
