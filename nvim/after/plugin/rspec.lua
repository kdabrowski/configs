require('rspec').setup({
  -- File format to allow rspec to run
  allowed_file_format = function(filename)
    return vim.endswith(filename, "_spec.rb")
  end,

  -- RSpec formatter. "progress", "p", "documentation" and "d" can be specified.
  -- If none of the above, use "progress".
  formatter = "progress",

  -- Whether or not to focus on a window when `ShowLastSpecResult` command executed.
  focus_on_last_spec_result_window = true,

  -- Whether or not to open the quickfix window when the spec fails.
  open_quickfix_when_spec_failed = true,

  -- File path to save the last spec result.
  last_result_path = vim.fn.stdpath("data") .. "/" .. "rspec_last_result",

  -- File path to save the last failed spec result.
  last_failed_result_path = vim.fn.stdpath("data") .. "/" .. "rspec_last_failed_result",

  -- Command to open the file to jump to.
  jump_command = "edit",

  -- Directories to ignore when jumping with the RSpecJump command
  ignored_dirs_on_jump = {},
})

-- Move keymaps outside of setup
vim.keymap.set("n", "<leader>rn", ":RSpecNearest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rf", ":RSpecCurrentFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rr", ":RSpecRerun<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rF", ":RSpecOnlyFailures<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rs", ":RSpecShowLastResult<CR>", { noremap = true, silent = true })

-- Move user command outside of setup
vim.api.nvim_create_user_command('RJ', function(args)
  require('rspec').jump({ force = args.bang })
end, { bang = true })
