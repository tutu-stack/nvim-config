-- set leader key to ,
vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

----------------------- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("n", "],:w", "<Cmd>w<CR>", { desc = "Save", silent = true, noremap = true })
keymap.set("n", "Q", "<Cmd>quit<CR>", { desc = "Quit", silent = true, noremap = true })
keymap.set("n", "<c-m>", "%", { silent = true, noremap = true })
keymap.set("n", "<space><space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", { silent = true, noremap = true })

-- clear search highlights
keymap.set("n", "<leader><space>", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- window management
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

--keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
--keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
--keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
--keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
--keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "<leader>bd", "<cmd>bd<CR>", opt)
map("n", "<leader>bD", "<cmd>bd!<CR>", opt)
