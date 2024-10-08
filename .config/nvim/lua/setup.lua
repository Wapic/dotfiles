-- Colorscheme setup
local vscode = require "vscode"
local colors = require "vscode.colors"

colors.get_colors()

vscode.setup({
    transparent = true,
    italic_comments = true,
    underline_links = true,
    disable_nvimtree_bg = true,
})

vscode.load('dark')

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
local lsp = require "lspconfig"
local coq = require "coq"

vim.g.coq_settings = { 
    auto_start = 'shut-up' 
}

lsp.ts_ls.setup(coq.lsp_ensure_capabilities({}))

-- fzf setup
vim.g.fzf_layout = { 
    window = { 
        width = 0.9, 
        height = 0.9, 
    } 
}
