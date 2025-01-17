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

return true
