--NOTE:
local lspconfig = require("lspconfig")
local servers = {
        "clangd",
        "rust_analyzer",
        "lua_ls",
        "pyright",
        "marksman"
        -- "hls",
        -- "volar",
        -- "tsserver",
        -- "html",
}

for _, server in pairs(servers) do
        local opts = {
                on_attach = require("Miku-vim.plugin.conf.lsp.handlers").on_attach,
                capabilities = require("Miku-vim.plugin.conf.lsp.handlers").capabilities,
        }

        local has_custom_opts, server_custom_opts = pcall(require, "Miku-vim.plugin.conf.lsp.settings." .. server)
        if has_custom_opts then
                opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
        end
        lspconfig[server].setup(opts)
end
