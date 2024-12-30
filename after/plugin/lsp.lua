local lsp = require('lsp-zero').preset("recommended")

lsp.on_attach(function(client, bufnr)
    local bufopts = { buffer = bufnr, remap = false }
    local keymaps = {
        { "n", "gd",          vim.lsp.buf.definition,       "Go to definition" },
        { "n", "K",           vim.lsp.buf.hover,            "Hover information" },
        { "n", "<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace symbols" },
        { "n", "<leader>vd",  vim.diagnostic.open_float,    "Show diagnostics" },
        { "n", "[d",          vim.diagnostic.goto_next,     "Next diagnostic" },
        { "n", "]d",          vim.diagnostic.goto_prev,     "Previous diagnostic" },
        { "n", "<leader>vca", vim.lsp.buf.code_action,      "Code action" },
        { "n", "<leader>vrr", vim.lsp.buf.references,       "References" },
        { "n", "<leader>vrn", vim.lsp.buf.rename,           "Rename symbol" },
        { "i", "<C-h>",       vim.lsp.buf.signature_help,   "Signature help" },
    }
    for _, km in ipairs(keymaps) do
        vim.keymap.set(km[1], km[2], km[3], vim.tbl_extend('force', bufopts, { desc = km[4] }))
    end
end)

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls', 'bashls', 'jsonls', 'dockerls', 'docker_compose_language_service',
        'marksman', 'pyright', 'yamlls', 'phpactor', 'ts_ls', 'volar'
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup(lsp.defaults.cmp_config({
    formatting = lsp.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.complete(),
    }),
}))

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
