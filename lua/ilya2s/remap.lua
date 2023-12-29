-- Set leader key to space
vim.g.mapleader = " "

-- Project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move line/block with Up/Down keys when selected
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- Apped the line bellow with a space
vim.keymap.set("n", "J", "mzJ`z")

-- Jump half page & keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep Search terms in the middle of the page
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without re-copy
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to System clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register (delete without copy)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-Down>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
