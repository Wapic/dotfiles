vim.opt.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('junegunn/fzf', {
    ['do'] = function()
	    vim.fn['fzf#install']()
    end
})

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

Plug('ms-jpq/chadtree', {
	['branch'] = 'chad',
	['do'] = 'python3 -m chadtree deps'
})

Plug('nvim-treesitter/nvim-treesitter', {
	['do'] = ':TSUpdate'
})

Plug('nvim-lualine/lualine.nvim')

Plug('nvim-tree/nvim-web-devicons')

Plug('wapic/greentheme-nvim')

vim.call('plug#end')

require("setup")
require("keybinds")
