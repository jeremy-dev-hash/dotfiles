require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "rust_analyzer",
        "gopls",
        "clangd",
        "lua_ls",
    },
    automatic_installation = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
    local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gr", vim.lsp.buf.references, "Go to references")
    map("K", vim.lsp.buf.hover, "Hover documentation")
    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format file")
    map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
    map("<leader>e", vim.diagnostic.open_float, "Show diagnostic")
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        on_attach(nil, args.buf)
    end,
})

local servers = {
    pyright = {},
    rust_analyzer = {},
    gopls = {},
    clangd = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    },
}

for server, config in pairs(servers) do
    config.capabilities = capabilities
    vim.lsp.config(server, config)
end

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
