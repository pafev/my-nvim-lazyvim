-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local del = vim.keymap.del

del("n", "<C-Up>")
del("n", "<C-Down>")
del("n", "<C-Left>")
del("n", "<C-Right>")

del("n", "<S-h>")
del("n", "<S-l>")

del("n", "<leader>-")
del("n", "<leader>|")

del("n", "<leader>be")
del("n", "<leader>fe")
del("n", "<leader>fE")
del("n", "<leader>E")
del("n", "<leader>,")

local map = vim.keymap.set

-- move lines
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<C-PageUp>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("i", "<C-PageUp>", "<esc><cmd>BufferLineCyclePrev<cr>a", { desc = "Prev Buffer" })
map("n", "<C-S-PageUp>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Prev" })
map("i", "<C-S-PageUp>", "<esc><cmd>BufferLineMovePrev<cr>a", { desc = "Move Buffer Prev" })
map("n", "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("i", "<C-PageDown>", "<esc><cmd>BufferLineCycleNext<cr>a", { desc = "Next Buffer" })
map("n", "<C-S-PageDown>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Next" })
map("i", "<C-S-PageDown>", "<esc><cmd>BufferLineMoveNext<cr>a", { desc = "Move Buffer Next" })
map("n", "<C-d>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })

-- windows
map("n", "<S-PageUp>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<S-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<S-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<S-PageDown>", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<leader>w<Down>", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w<Right>", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Resize window using <ctrl> hjkl keys
map("n", "<C-k>", "<cmd>resize +2<cr>")
map("n", "<C-j>", "<cmd>resize -2<cr>")
map("n", "<C-h>", "<cmd>vertical resize -2<cr>")
map("n", "<C-l>", "<cmd>vertical resize +2<cr>")

-- terminals
map("t", "<C-d>", "<cmd>close<cr>", { desc = "Close terminal" })
map("t", "<C-q>", [[<C-\><C-n>]], { desc = "Exit terminal mode", noremap = true, silent = true })

-- commenting
map("n", "<A-/>", "<cmd>normal gcc<cr>", { desc = "Comment line" })
map("i", "<A-/>", "<esc><cmd>normal gcc<cr>i", { desc = "Comment line in insert mode" })
map("x", "<A-/>", "<cmd>normal gcc<cr>", { desc = "Comment lines" })

-- some basics
map("i", "<C-z>", "<esc>ui")
map("n", "<C-z>", "u")
map("n", "<C-a>", "gg<S-v>G")
map("i", "<C-a>", "<esc>gg<S-v>G")
map("n", "<S-A-Up>", "yyP")
map("i", "<S-A-Up>", "<esc>yyPi")
map("n", "<S-A-Down>", "yyp")
map("i", "<S-A-Down>", "<esc>yyPi")
map("x", "<tab>", ">")
map("x", "<S-tab>", "<")
map({ "n", "x" }, "<C-Right>", "e")
map({ "n", "x" }, "<C-Left>", "b")

-- dont save deleted chars in clipboard
map("n", "x", '"_x')
map({ "n", "x" }, "d", '"_d', { noremap = true })
map("n", "D", '"_D', { noremap = true })
map("n", "c", '"_c')

-- dont exit visual mode after yank
map("x", "y", "ygv")

-- easy diagnostics
map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)
