-- Appearance setup
local greentheme = require "greentheme"
local lualine = require "lualine"

greentheme.setup({
        -- Default options
    override = {},
    transparent_background = false,
    nvim_tree = {
        contrast = false,
    },

    -- Configuration examples

    -- Override the default highlights using Everblush or other colors
    override = {
    },

    -- Set transparent background
    transparent_background = true,

    -- Set contrast for nvim-tree highlights
    nvim_tree = {
        contrast = true,
    },
})

vim.cmd("colorscheme greentheme")

lualine.setup({
    options = {
        them = "auto",
    },
})

-- lualine setup


-- Treesitter setup
local treesitter = require "nvim-treesitter.configs"

treesitter.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "markdown", "bash", "cpp", "html", "json", "python", "rust", "toml", "hyprlang"},
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- LSP / Autocompletion setup

vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        recommended = false,
    },
}

local lsp = require "lspconfig"
local coq = require "coq"

lsp.ts_ls.setup(coq.lsp_ensure_capabilities{})
lsp.pyright.setup(coq.lsp_ensure_capabilities{})
lsp.bashls.setup(coq.lsp_ensure_capabilities{})
lsp.lua_ls.setup(coq.lsp_ensure_capabilities{})

-- fzf setup
vim.g.fzf_layout = {
    window = {
        width = 0.9,
        height = 0.9,
    },
}
