-- Key mapping utility
local keymap = vim.keymap.set

-- Nvim-Tree
keymap("n", "<leader>nt", function()
  require("nvim-tree.api").tree.toggle()
end, { noremap = true, silent = true, desc = "Toggle Nvim Tree" })

-- Example: Add more custom keymaps here
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find Files" })
-- keymap("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "Open LazyGit" })

return true -- Indicate the file was successfully loaded
