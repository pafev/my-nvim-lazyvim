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
map("n", "<C-S-PageUp>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Prev" })
map("n", "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<C-S-PageDown>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Next" })
map("n", "<C-d>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })

-- windows
map("n", "<S-PageUp>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<S-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<S-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<S-PageDown>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> hjkl keys
map("n", "<C-k>", "<cmd>resize +2<cr>")
map("n", "<C-j>", "<cmd>resize -2<cr>")
map("n", "<C-h>", "<cmd>vertical resize -2<cr>")
map("n", "<C-l>", "<cmd>vertical resize +2<cr>")

-- terminals
map("n", "<leader>tT", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<leader>tt", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
map("t", "<C-d>", "<cmd>close<cr>", { desc = "Close terminal" })

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
map("x", "<tab>", ">>")
map("x", "<S-tab>", "<<")
-- map("n", "<C-S-Up>", "<Plug>(VM-Add-Cursor-Up)")
-- map("n", "<C-S-Down>", "<Plug>(VM-Add-Cursor-Down)")

-- dont save deleted chars in clipboard
map("n", "x", '"_x')
map({ "n", "x" }, "d", '"_d')
map("n", "dd", '"_dd')
map("n", "c", '"_c')

map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)
