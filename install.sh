#!/usr/bin/bash

# This is just a small install script for the gnome desktop on arch linux.
# It installs a few packages and tweaks the desktop a little using `dconf`.

install_packages () {
    sudo pacman -S --needed \
    gnome-shell \
    gnome-tweaks \
    gnome-shell-extensions \
    gnome-control-center
}



