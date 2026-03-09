require("gitsigns").setup({
    signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]c", gs.next_hunk, "Next hunk")
        map("n", "[c", gs.prev_hunk, "Prev hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Git blame")
        map("n", "<leader>gd", gs.diffthis, "Git diff")
        map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
    end,
})
