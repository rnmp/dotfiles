vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex) 
vim.keymap.set("n", "<leader>conf", function() vim.cmd(":e ~/.config/nvim/init.lua") end)
vim.keymap.set("n", "<leader>cp", function() vim.cmd(":e ~/.config/nvim/lua/plugins.lua") end)
vim.keymap.set("n", "<C-[>", vim.cmd.cprevious, { silent = true })
vim.keymap.set("n", "<C-]>", vim.cmd.cnext, { silent = true })
