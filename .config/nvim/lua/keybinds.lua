vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>v", '"+p')
vim.keymap.set("n", "<C-o>", "<cmd>CHADopen<cr>")
vim.keymap.set("n", "<C-a>", "<ESC>^")
vim.keymap.set("n", "<C-e>", "<ESC>$")
vim.keymap.set("n", "<C-r>", "<cmd>call fzf#run(fzf#wrap({ 'options' : ['--preview', 'bat --color=always {}']}))<cr>")

vim.api.nvim_set_keymap("i", "<Esc>", [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-c>", [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<BS>", [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<CR>", [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]], {expr = true, silent = true})

vim.keymap.set("v", "<C-c>", '"+y<cr>')
