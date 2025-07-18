-- init.lua or lua/plugins/lsp.lua

-- Setup Mason for managing external LSP servers, linters, formatters
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "eslint",           -- ESLint server
    "solargraph",       -- Ruby server (example)
    "rubocop",          -- Ruby linter/formatter
  },
})

local lspconfig = require("lspconfig")

-- Helper for default capabilities with nvim-cmp completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- ESLint server setup with formatting disabled (if you use prettier)
lspconfig.eslint.setup({
  capabilities = capabilities,
  cmd = { "eslint-lsp", "--stdio" },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true

    -- Show hover info about the error
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

    -- Show diagnostics popup for current line
    vim.keymap.set("n", "<leader>w", vim.diagnostic.open_float, bufopts)

    -- Jump to previous diagnostic
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)

    -- Jump to next diagnostic
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
  end,
})

-- Prettier for text formatting
require("conform").setup({
  formatters_by_ft = {
    vue = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
  },
})

-- CSS Language Server
lspconfig.cssls.setup({
  capabilities = capabilities,
})

-- Ruby Solargraph server example
lspconfig.solargraph.setup({
  capabilities = capabilities,
  settings = {
    diagnostics = true,
    useBundler = true,
  },
})

-- Ruby Rubocop example
lspconfig.rubocop.setup({
  capabilities = capabilities,
  settings = {
    executePath = "/Users/krzysztofdabrowski/.rvm/gems/ruby-3.1.6@global/bin/",
  },
})

local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

local vue_ls_config = {
  on_init = function(client)
    client.handlers['tsserver/request'] = function(_, result, context)
      local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
      if #clients == 0 then
        vim.notify('Could not found `vtsls` lsp client, vue_lsp would not work without it.', vim.log.levels.ERROR)
        return
      end
      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)
      ts_client:exec_cmd({
        title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
        command = 'typescript.tsserverRequest',
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
          local response_data = { { id, r.body } }
          ---@diagnostic disable-next-line: param-type-mismatch
          client:notify('tsserver/response', response_data)
        end)
    end
  end,
}
-- nvim 0.11 or above
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.enable({'vtsls', 'vue_ls'})

-- Setup some basic keymaps on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- Basic mappings (example)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

