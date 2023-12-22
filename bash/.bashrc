stty -ixon

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias cdd='cd ~/.dotfiles'
alias cdp='cd ~/projects'
alias vime='cd ~/.dotfiles/nvim && nvim .'
alias vim='nvim'
alias sd="cd ~ && cd \$(find * -type d | fzf)"

export XDG_CONFIG_HOME="$HOME/.config"
export RANGER_LOAD_DEFAULT_RC=False
export ASPNETCORE_ENVIRONMENT=Local
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export DOTNET_ROOT=$HOME/.dotnet

eval "$(starship init bash)"
