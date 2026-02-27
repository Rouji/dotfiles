local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>n", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>p", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>r", function() require('telescope.builtin').lsp_references() end, opts)
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['null-ls'] = { 'python', 'typescript', 'lua' },
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})


require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "rust_analyzer",
        "ts_ls",
        "bashls",
        "clangd",
        "cssls",
        "ansiblels",
        "dockerls",
        "docker_compose_language_service",
        "pyright",
        "lua_ls",
        "elmls",
    },
    handlers = {
        lsp.default_setup,
    },
})

vim.lsp.config('ansiblels', {
    filetypes = { "yaml", }
})
vim.lsp.enable('ansiblels')

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
    }
})
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
