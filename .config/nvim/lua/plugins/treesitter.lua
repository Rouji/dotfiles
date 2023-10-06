require('nvim-treesitter.configs').setup {
    ensure_installed = {"c", "rust", "lua", "bash", "python", "vim", "diff", "dockerfile", "html", "json", "xml", "cpp", "css", "ocaml" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
    },
}
