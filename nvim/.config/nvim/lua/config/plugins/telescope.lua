require("telescope").setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        preview = {
            treesitter = false,
        },
    },
})
