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

local lsp = require "lspconfig"
local cmp = require "cmp"

cmp.setup({
    snippet = {},
    window = {
        -- completion = cmp.config.window.bordered()
        -- documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true}),
    }),
    sources = cmp.config.sources({
     { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('ts_ls', { capabilities = capabilities })
vim.lsp.enable('ts_ls')

vim.lsp.config('pyright', { capabilities = capabilities })
vim.lsp.enable('pyright')

vim.lsp.config('bashls', { capabilities = capabilities })
vim.lsp.enable('bashls')

vim.lsp.config('lua_ls', { capabilities = capabilities })
vim.lsp.enable('lua_ls')

-- fzf setup
vim.g.fzf_layout = {
    window = {
        width = 0.9,
        height = 0.9,
    },
}
