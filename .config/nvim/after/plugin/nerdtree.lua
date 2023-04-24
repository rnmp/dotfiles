vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeStatusline = " "

vim.keymap.set("", "<C-j>", function() vim.cmd(":vs %:h") end)
