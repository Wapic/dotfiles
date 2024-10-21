# QOL
alias sudo='sudo '
alias plz='sudo !!'
alias cp='cp -i'                         # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias vim='nvim'
alias cmake='make -j $(nproc)'
alias ls='ls --group-directories-first -X --color=always'
alias xprop="hyprprop"

# SCRIPTS
alias aur='/home/wapic/scripts/aurbuild.py'
alias yt-dl='/home/wapic/scripts/yt-dl.py'

# CHANGE DIR
alias wpc='cd /home/wapic/.local/share/PrismLauncher/instances/1.8.9/.minecraft/config/ChatTriggers/modules/'
alias nvssd='cd /mnt/nvssd/'
alias hdd="cd /mnt/hdd/"
alias ssd="cd /mnt/ssd/"
alias bigssd="cd /mnt/bigssd/"

# ETC
alias ssh="kitten ssh "
alias find="fzf --preview='/home/wapic/scripts/fzf-preview.sh {}' "
