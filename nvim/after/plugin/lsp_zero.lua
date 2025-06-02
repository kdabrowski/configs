-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
local lsp_zero = require('lsp-zero')
require('mason').setup()
require('mason-lspconfig').setup()

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  -- otherwise you'll get a warning message
end)

require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
   lsp_zero.default_setup,
   solargraph = function()
     require('lspconfig').solargraph.setup {
      settings = {
        {
          diagnostics = true,
          useBundler = true
        }
      }
    }
   end,
   rubocop = function()
     require('lspconfig').rubocop.setup {
       settings = {
         {
           executePath = '/User/krzysztofdabrowski/.rvm/gems/ruby-3.1.6@global/bin/'
        }
       }
     }
   end,
    eslint = function()
      require('lspconfig').eslint.setup {
        on_attach = function(client, bufnr)
          -- disable formatting capability if using prettier or other formatter
          client.server_capabilities.documentFormattingProvider = false
        end,
      }
    end,
  },
})
