# Useful stuff for editing:
# example code: https://github.com/zsh-users/zsh/tree/master/Misc
# docs: man zshcontrib

# ZSH
# %F: Opening foreground color %f: close foreground color
# %K: Opening background color %k: close background color
# %n: Username
# %m: Hostname (or misc in certain contexts i.e: vcs_info formats)
# %N~: current directory, N = how many parent directories to show

# vcs_info formats
# %b: branch
# %u: unstaged changes %

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' hooks setEndPrompt

setopt PROMPT_SUBST

+vi-setEndPrompt() {
    branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    isDirty="$(git status --porcelain 2> /dev/null)"

    PROMPT_END="%F{234}%2~ %k%F{0004}"
    if [ -n "$branch" ]; then
        PROMPT_END="%F{234}%1~ %K{green}%F{0004}%F{234}  $branch %k%F{green}"
        if [ -n "$isDirty" ]; then
            PROMPT_END="%F{234}%1~ %K{yellow}%F{0004}%F{234}  $branch %k%F{yellow}"
        fi
    fi
}

PROMPT_START='%K{234}%F{green} %n@%m %K{0004}%F{234}'
PROMPT='$PROMPT_START $PROMPT_END%f%k%b '
