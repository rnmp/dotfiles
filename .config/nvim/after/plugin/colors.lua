vim.cmd("syntax on")
vim.cmd("syntax reset")
vim.cmd("set termguicolors")
vim.cmd("set noshowmode")
vim.cmd("set noshowcmd")
vim.cmd("hi clear")


-- Example config in lua
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = false
vim.g.nord_bold = true

-- Load the colorscheme
vim.cmd("colorscheme nord")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
