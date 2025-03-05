-- Key mapping utility
local keymap = vim.keymap.set

-- General key mappings
-- Turn off search highlight
keymap("n", "<leader>nohl", ":nohlsearch<CR>", { desc = "Turn off search highlight" })

-- Nvim-Tree
keymap("n", "<leader>nt", function()
  require("nvim-tree.api").tree.toggle()
end, { noremap = true, silent = true, desc = "Toggle Nvim Tree" })

-- Keybinding for opening tree at the current file
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')

keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

keymap('n', '<leader>gd', function()
  local clients = vim.lsp.get_active_clients()
  if #clients > 0 then
    builtin.lsp_definitions() -- Use Telescope for LSP definitions
  else
    print("No LSP server attached")
  end
end, { desc = 'Go to Definition' })

-- Bufferline
keymap("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>br", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
keymap("n", "<leader>bl", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Close current buffer" })
keymap("n", "<leader>ba", ":bufdo bdelete<CR>", { desc = "Close all buffers" })
keymap("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all except current" })

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

-- Other key mappings
vim.keymap.set('n', '<leader>cf', ':CopyFullPath<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cr', ':CopyRelativePath<CR>', { noremap = true, silent = true })

-- Avante keymaps
vim.keymap.set("n", "<leader>aa", "<cmd>AvanteAsk<cr>", { noremap = true, silent = true, desc = "Avante: Ask AI" })
vim.keymap.set("n", "<leader>at", "<cmd>AvanteToggle<cr>", { noremap = true, silent = true, desc = "Avante: Toggle Sidebar" })
vim.keymap.set("n", "<leader>ar", "<cmd>AvanteRefresh<cr>", { noremap = true, silent = true, desc = "Avante: Refresh Sidebar" })
vim.keymap.set("n", "<leader>af", "<cmd>AvanteFocus<cr>", { noremap = true, silent = true, desc = "Avante: Focus Sidebar" })
vim.keymap.set("n", "<leader>a?", "<cmd>AvanteSwitchProvider<cr>", { noremap = true, silent = true, desc = "Avante: Switch AI Provider" })
vim.keymap.set("n", "<leader>ae", "<cmd>AvanteEdit<cr>", { noremap = true, silent = true, desc = "Avante: Edit Selected Blocks" })

-- Conflict resolution keymaps
vim.keymap.set("n", "co", "<cmd>AvanteChooseOurs<cr>", { noremap = true, silent = true, desc = "Avante: Choose Ours" })
vim.keymap.set("n", "ct", "<cmd>AvanteChooseTheirs<cr>", { noremap = true, silent = true, desc = "Avante: Choose Theirs" })
vim.keymap.set("n", "ca", "<cmd>AvanteChooseAllTheirs<cr>", { noremap = true, silent = true, desc = "Avante: Choose All Theirs" })
vim.keymap.set("n", "c0", "<cmd>AvanteChooseNone<cr>", { noremap = true, silent = true, desc = "Avante: Choose None" })
vim.keymap.set("n", "cb", "<cmd>AvanteChooseBoth<cr>", { noremap = true, silent = true, desc = "Avante: Choose Both" })
vim.keymap.set("n", "cc", "<cmd>AvanteChooseCursor<cr>", { noremap = true, silent = true, desc = "Avante: Choose Cursor" })

-- Navigation keymaps
vim.keymap.set("n", "]x", "<cmd>AvanteNextConflict<cr>", { noremap = true, silent = true, desc = "Avante: Next Conflict" })
vim.keymap.set("n", "[x", "<cmd>AvantePrevConflict<cr>", { noremap = true, silent = true, desc = "Avante: Previous Conflict" })
vim.keymap.set("n", "]]", "<cmd>AvanteNextCodeblock<cr>", { noremap = true, silent = true, desc = "Avante: Next Codeblock" })
vim.keymap.set("n", "[[", "<cmd>AvantePrevCodeblock<cr>", { noremap = true, silent = true, desc = "Avante: Previous Codeblock" })

return true
