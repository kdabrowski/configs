vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leadr>TT", function() require("neotest").run.run() end)
vim.keymap.set("n", "<leadr>TF", function() require("neotest").run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>f", function() require("conform").format({ async = true }) end, { desc = "Format file" })

