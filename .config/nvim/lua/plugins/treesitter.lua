require('nvim-treesitter').setup {}

require('nvim-treesitter').install { "c", "rust", "lua", "bash", "python", "vim", "diff", "dockerfile", "html", "json", "xml", "cpp", "css", "ocaml" }

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
