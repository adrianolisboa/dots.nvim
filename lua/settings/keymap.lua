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
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

keymap("n", "<leader>bn", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
keymap("n", "<leader>bp", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Close current buffer" })

return true
