-- see https://github.com/neovim/nvim-lspconfig

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
local km = vim.keymap.set
km('n', '<space>e', vim.diagnostic.open_float, opts)
km('n', '[d', vim.diagnostic.goto_prev, opts)
km('n', ']d', vim.diagnostic.goto_next, opts)
km('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  km('n', 'gD', vim.lsp.buf.declaration, bufopts)
  km('n', 'gd', vim.lsp.buf.definition, bufopts)
  km('n', 'K', vim.lsp.buf.hover, bufopts)
  km('n', 'gi', vim.lsp.buf.implementation, bufopts)
  km('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  km('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  km('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  km('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  km('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  km('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  km('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  km('n', 'gr', vim.lsp.buf.references, bufopts)
  km('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['clangd'].setup { capabilities = capabilities }

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}

