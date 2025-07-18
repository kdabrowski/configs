require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = true -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
})
