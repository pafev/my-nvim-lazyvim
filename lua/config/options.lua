-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

local opt = vim.opt

opt.linebreak = false
opt.relativenumber = false
vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_cmp = "nvim-cmp"
opt.backspace = { "start", "eol", "indent" }
opt.splitright = true
opt.splitkeep = "cursor"
opt.formatoptions:append({ "r" })
