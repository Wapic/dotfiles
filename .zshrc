export EDITOR="/usr/bin/nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_FOLDER="$XDG_CONFIG_HOME/zsh"

HISTFILE="$HOME/.zhistory"
HISTSIZE="10000"
SAVEHIST="10000"

# case insensitive completion
autoload -U compinit; compinit
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# case insensitive completion only if no case sensitive matches found
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

bindkey -e

source $ZSH_FOLDER/aliases.zsh
source $ZSH_FOLDER/wapic.zsh-theme
source $ZSH_FOLDER/extract.zsh
. ~/scripts/git-prompt.sh

source <(fzf --zsh)
