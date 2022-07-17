# Gnome on Arch Linux

## What it does

This is just a small install script for the gnome desktop on arch linux.  
It installs a few packages and tweaks the desktop a little using `dconf`.  



## DISCLAIMER

This script is only meant for the installation of gnome and the **initial configuration**. If you already have shortcuts (key combinations) present and they collide with those coming from this script, **things could break!**  

Also certain extensions expect to be able to use certain key combinations since they are normally not used. Using this script `Super+1` e.g. is meant to bring you to workspace 1. Certain extensions might want to use `Super+1` to launch an application 1 instead. This leads to problems, so be aware of this.  



## What's included?

### Packages

This script currently includes the automatic installation of the following packages:

| Package                  | Why?                                                                            |
| ----                     | ----                                                                            |
| `gnome-shell`            | Actual desktop                                                                  |
| `gnome-tweaks`           | Tweaking tool                                                                   |
| `gnome-shell-extensions` | Ability to extend gnome shell using [extensions](https://extensions.gnome.org/) |
| `gnome-control-center`   | Basic control center to change settings                                         |

### Actual tweaking

List of tweaks / changes  
- WIP
- WIP
- WIP


## Usage

To run the script just clone the repository and execute `install.sh`. This will install the packages and then exit.  
Providing `--all` will install the packages and also tweak the desktop according to the `.conf`-files within the `dconf` directory. The actual magic happens here.  
If you only want to use certain parts of this configuration, use `dconf load / < ./dconf/FILENAME.conf` instead.  



## Notes

### 

### Display managers

There is no plan to implement installing display managers.  
When running gnome you should probably use `gdm` if you plan on using gnome's `screensaver` since it relies gdm to work.  
Running anything else will result in you having to find your own solution for screen locking.  

### Manually starting a session

If you don't want to use any display manager (thinking of `startx`), you should **always run `gnome-session`** instead of `gnome-shell`.  
This allows you to still be able to logout of your session without having to kill your gnome-shell.  

Below you see an example `.xinitrc` file to be able to demand a specific graphical session from a tty.  

```bash
#!/bin/sh
# Default if nothing else is specified
default=awesome

# Session becomes whatever you choose via cli
# If nothing is chosen, default is used
session=${1:-$default}


# Switch case (add your desktop accordingly)
case $session in
    awesome)
        exec awesome
        ;;

    i3)
        exec i3
        ;;

    cinnamon)
        exec cinnamon-session
        ;;

    xfce|xfce4)
        exec xfce4-session
        ;;

    gnome)
        export XDG_SESSION_TYPE=x11
        export GDK_BACKEND=x11
        exec gnome-session
        ;;

    kde)
        exec startplasma-x11
        ;;

    *)
        exec $default
        ;;
esac
```

**Usage:**  
`startx /PATH/TO/YOUR/.xinitrc YOUR_DESKTOP`  

**Example:**  
`startx /home/donien/.xinitrc gnome`  

If you don't want to specify your `.xinitrc` everytime, you can use an alias.  
`alias startx="startx $HOME/.xinitrc"`  
Now you can just use `startx gnome`.  
