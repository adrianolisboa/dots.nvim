-- Key mapping utility
local keymap = vim.keymap.set

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

-- Neotest keymaps
keymap("n", "<leader>tn", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

keymap("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run tests in the current file" })

keymap("n", "<leader>ts", function()
  require("neotest").run.run("test_suite")
end, { desc = "Run the entire test suite" })

keymap("n", "<leader>tl", function()
  require("neotest").run.run_last()
end, { desc = "Re-run the last test" })

keymap("n", "<leader>tv", function()
  require("neotest").output.open({ enter = true })
end, { desc = "View test output" })

-- Formatter
keymap("n", "<leader>mf", function()
  require("conform").format({ async = true })
end, { desc = "Format current file" })

-- Verbose formatting
keymap("n", "<leader>mfv", function()
  require("conform").format({ async = false, verbose = true })
end, { desc = "Format current file verbosely" })

-- Show formatting diff
keymap("n", "<leader>mfd", function()
  require("conform").format({ diff = true })
end, { desc = "Format and show diff" })

return true
