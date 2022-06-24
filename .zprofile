export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
export EDITOR=nvim

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
