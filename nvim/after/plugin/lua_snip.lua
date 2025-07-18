-- LuaSnip setup
local luasnip = require("luasnip")

-- Load friendly-snippets (includes Vue 3)
require("luasnip.loaders.from_vscode").load()

-- Keymaps for expanding and jumping in snippets
vim.api.nvim_set_keymap("i", "<C-k>", [[<cmd>lua require'luasnip'.expand_or_jump()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-k>", [[<cmd>lua require'luasnip'.expand_or_jump()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-j>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true, silent = true })

-- Optional: ChoiceNode cycling (for snippets with choices)
vim.api.nvim_set_keymap("i", "<C-l>", [[<cmd>lua require'luasnip'.change_choice(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-l>", [[<cmd>lua require'luasnip'.change_choice(1)<CR>]], { noremap = true, silent = true })

