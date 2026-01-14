vim.opt.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.expandtab = true
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

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('ms-jpq/coq.artifacts', {
	['branch'] = 'artifacts'
})

Plug('ms-jpq/coq.thirdparty', {
    ['branch'] = '3p'
})

Plug('ms-jpq/chadtree', {
	['branch'] = 'chad',
	['do'] = 'python3 -m chadtree deps'
})

Plug('nvim-treesitter/nvim-treesitter', {
	['do'] = ':TSUpdate'
})

Plug('neovim/nvim-lspconfig')

Plug('nvim-lualine/lualine.nvim')

Plug('nvim-tree/nvim-web-devicons')

Plug('wapic/greentheme-nvim')

vim.call('plug#end')

require("setup")
require("keybinds")
