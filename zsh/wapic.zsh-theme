autoload -Uz compinit && compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

# Useful stuff for editing:
# example code: https://github.com/zsh-users/zsh/tree/master/Misc
# docs: man zshcontrib

# ZSH
# %F: Opening foreground color %f: close foreground color
# %K: Opening background color %k: close background color
# %n: Username
# %m: Hostname (or misc in certain contexts i.e: vcs_info formats)
# %N~: current directory, N = how many parent directories to show

# GIT
# %b: branch
# %u: unstaged changes %

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%K{%u}%F{236}  %b %k%F{%u}%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git+set-message:*' hooks isDirty
zstyle ':vcs_info:-quilt-+no-vcs:*' hooks setDir
# zstyle ':vcs_info:*+*:*' debug true

setopt PROMPT_SUBST

+vi-setDir() {
    PROMPT_DIR='%F{236} %1~ %k%F{0004}%f'
}

+vi-isDirty() {
    if [[ $(git status --porcelain --ignore-submodules) ]]; then
        hook_com[unstaged]="yellow"
        PROMPT_DIR='%F{236} %1~ %k%K{yellow}%F{0004}%f%k'
    else
        hook_com[unstaged]="green"
        PROMPT_DIR='%F{236} %1~ %k%K{green}%F{0004}%f%k'
    fi
}

PROMPT_USER='%K{236}%F{green} %n@%m%f %k%K{0004}%F{236}%f'
PROMPT='$PROMPT_USER$PROMPT_DIR${vcs_info_msg_0_}%f%k%b '
