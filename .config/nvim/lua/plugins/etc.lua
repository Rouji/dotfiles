require('lsp_signature').setup()
require('gitsigns').setup()
require('mason').setup()
require('chatgpt').setup({
    api_key_cmd = 'secret-tool lookup chatgpt nvim',
    openai_params = {
        max_tokens = 300,
    }
})

-- require('gruvbox').setup({
--     contrast = 'hard',
-- })
vim.cmd("colorscheme gruvbox")
