set number
set expandtab
set shiftwidth=4
set tabstop=4

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install () } }

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'

Plug 'Mofiqul/vscode.nvim'

call plug#end()

lua require("keybinds")

lua require("setup")
