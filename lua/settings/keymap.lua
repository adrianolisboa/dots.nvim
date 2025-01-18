-- Key mapping utility
local keymap = vim.keymap.set

-- General key mappings
-- Turn off search highlight
keymap("n", "<leader>nohl", ":nohlsearch<CR>", { desc = "Turn off search highlight" })

-- Nvim-Tree
keymap("n", "<leader>nt", function()
  require("nvim-tree.api").tree.toggle()
end, { noremap = true, silent = true, desc = "Toggle Nvim Tree" })

-- Telescope
local builtin = require('telescope.builtin')

keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Bufferline
keymap("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Close current buffer" })
keymap("n", "<leader>br", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
keymap("n", "<leader>bl", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })

-- Vim-Test
keymap("n", "<leader>tn", ":TestNearest<CR>", { desc = "Run nearest test" })
keymap("n", "<leader>tf", ":TestFile<CR>", { desc = "Run tests in file" })
keymap("n", "<leader>ts", ":TestSuite<CR>", { desc = "Run entire test suite" })
keymap("n", "<leader>tl", ":TestLast<CR>", { desc = "Re-run last test" })
keymap("n", "<leader>tv", ":TestVisit<CR>", { desc = "Visit last test location" })

-- Formatter
keymap("n", "<leader>mf", function()
  require("conform").format({ async = true })
end, { desc = "Format current file" })

keymap("n", "<leader>md", function()
  require("conform").format({ diff = true })
end, { desc = "Format and show diff" })

keymap("n", "<leader>mv", function()
  require("conform").format({ async = false, verbose = true })
end, { desc = "Verbose format" })

return true
