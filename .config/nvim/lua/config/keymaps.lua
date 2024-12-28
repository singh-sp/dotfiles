-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>crr", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crt", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crP", ":CRProjects<CR>", { noremap = true, silent = false })
