#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH=$PATH:~/azure-functions-cli


if $(xrandr | grep " connected" | grep -q DP2-2) ; then
    xrandr --output DP2-2 --mode 3840x1600 --right-of eDP1 --primary --auto
else if $(xrandr | grep " connected" | grep -q DP2-1) ; then
    xrandr --output DP2-1 --mode 3840x1600 --left-of eDP1 --primary --auto
else 
    :
fi

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#	exec startx
#fi
