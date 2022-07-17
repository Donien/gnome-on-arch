#!/usr/bin/bash


install_packages () {
    sudo pacman -S --needed \
    gnome-shell \
    gnome-tweaks \
    gnome-shell-extensions \
    gnome-control-center
}


apply_all_dconf () {
    for conf_file in ./dconf/*.conf
    do
        # Catch empty / non existing dconf directory
        [ -e "$conf_file" ] || continue

        #dconf load / < "$conf_file"
        echo "$conf_file"
    done
}





# If no arguments are given just install packages
if [ "$#" -eq 0 ]
then
    install_packages
    exit 0
fi

case "$1" in
    --install)
        install_packages
        ;;

    --tweak)
        apply_all_dconf
        ;;

    --all)
        install_packages
        apply_all_dconf
        ;;

    *)
        >&2 echo "Unrecognized argument!"
        exit 3
        ;;
esac

exit 0
