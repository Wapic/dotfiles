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

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWCOLORHINTS=true

precmd() { 
    __git_ps1 "[%F{green}%n@%m%f |%F{blue} %2~%f" "]$ " " | %s"
}
