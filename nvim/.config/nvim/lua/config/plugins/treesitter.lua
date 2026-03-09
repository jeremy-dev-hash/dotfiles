require("nvim-treesitter").setup({
    ensure_installed = {
        "python", "rust", "go", "c", "cpp", "lua",
        "vim", "vimdoc", "query", "bash", "json", "yaml", "toml",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
})
