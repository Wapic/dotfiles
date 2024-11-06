-- Appearance setup
local onedark = require "onedark"
local lualine = require "lualine"

onedark.setup {
    style = 'darker'
}

vim.cmd("colorscheme onedark")
lualine.setup({
    options = {
        them = "auto",
    },
})

-- lualine setup


-- Treesitter setup
local treesitter = require "nvim-treesitter.configs"

treesitter.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "markdown", "bash", "cpp", "html", "json", "python", "rust", "toml"},
    auto_install = true,
 
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

-- LSP / Autocompletion setup

vim.g.coq_settings = { 
    auto_start = true, 
}

local lsp = require "lspconfig"
local coq = require "coq"

lsp.ts_ls.setup(coq.lsp_ensure_capabilities({}))

-- fzf setup
vim.g.fzf_layout = { 
    window = { 
        width = 0.9, 
        height = 0.9, 
    } 
}
