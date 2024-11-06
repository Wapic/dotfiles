vim.opt.number = true
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

Plug('ms-jpq/coq_nvim', {
	['branch'] = 'coq'
})

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

Plug('navarasu/onedark.nvim')

vim.call('plug#end')

require("setup")
require("keybinds")
