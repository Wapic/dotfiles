syntax on
set termguicolors
set number
set expandtab
set shiftwidth=4
set tabstop=4

call plug#begin('~/.config/nvim/plugged')

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'

Plug 'bignimbus/pop-punk.vim'

Plug 'Mofiqul/vscode.nvim'

Plug 'xiyaowong/nvim-transparent'

call plug#end()

let g:vscode_style = "dark"

let g:vscode_transparency = 1

let g:vscode_italic_comment = 1

colorscheme vscode

nnoremap <C-c> <cmd>CHADopen<cr>

nnoremap <C-a> <ESC>^

nnoremap <C-e> <ESC>$

map q <Nop>

let g:coq_settings = { 'auto_start': 'shut-up' }

let g:terminal_ansi_colors = pop_punk#AnsiColors()

let g:transparent_enabled = v:true

lua << EOF
require'nvim-treesitter.configs'.setup ({
  highlight = {
    enable = true,
  },
})
EOF
