vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.keymap.set("n", "<C-o>", "<cmd>CHADopen<cr>")
vim.keymap.set("n", "<C-a>", "<ESC>^")
vim.keymap.set("n", "<C-e>", "<ESC>$")
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("n", "<C-r>", "<cmd>call fzf#run(fzf#wrap({ 'options' : ['--preview', 'bat --color=always {}']}))<cr>")

vim.keymap.set("v", "<C-c>", '"+y<cr>')
