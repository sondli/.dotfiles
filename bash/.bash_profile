#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH=$PATH:~/azure-functions-cli
export PATH=$PATH:~/bin

if [ "{XDG_CURRENT_DESKTOP}" != "Hyprland" ]; then
    if $(xrandr | grep " connected" | grep -q DP2-2) ; then
        xrandr --output DP2-2 --mode 3840x1600 --right-of eDP1 --primary --auto
    elif $(xrandr | grep " connected" | grep -q DP2-1) ; then
        xrandr --output DP2-1 --mode 3840x1600 --left-of eDP1 --primary --auto
    else 
        :
    fi
fi

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#	exec startx
#fi
