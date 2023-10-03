#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias cddot='cd ~/.dotfiles'
alias cdpro='cd ~/projects'
alias nvimedit='cd ~/.dotfiles/nvim && nvim .'
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# If running in WSL:
if [[ $(grep -i Microsoft /proc/version) ]]
then
    # WSL specific commands 
    export LS_COLORS=$LS_COLORS:'ow=1;34:';
else
    # Non-WSL commands
    (cat ~/.cache/wal/sequences &)
fi  

##ENV
export XDG_CONFIG_HOME="$HOME/.config"
export RANGER_LOAD_DEFAULT_RC=False
##dotnet
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export ASPNETCORE_ENVIRONMENT=Local
