export ZSH_FOLDER="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZSH_FOLDER/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

autoload -U compinit; compinit
# case insensitive completion
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# case insensitive completion only if no case sensitive matches found
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'



source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/wapic.zsh-theme

source <(fzf --zsh)
