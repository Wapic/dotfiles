-- Appearance setup
local greentheme = require "greentheme"
local lualine = require "lualine"

greentheme.setup({
    transparent_background = true,
    nvim_tree = {
		contrast = false,
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
local treesitter = require "nvim-treesitter"

treesitter.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "markdown", "bash", "cpp", "html", "json", "python", "rust", "toml" },
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

-- LSP / Autocompletion setup

local lsp = require "lspconfig"
local cmp = require "cmp"

cmp.setup({
    snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
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
