-- leader key
vim.g.mapleader = " "

-- project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected line/block with up/down keys
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- Append line below with a space
vim.keymap.set("n", "J", "mzJ`z")

-- jump halfpage && keep cursor in middle of page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search terms in middle of page
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without re-copy
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete without re-copy
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- ctl+c -> Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfixes
vim.keymap.set("n", "<C-Up>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-Down>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- replace current word in file
vim.keymap.set(
    "n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
