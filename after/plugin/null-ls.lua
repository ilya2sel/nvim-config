local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Formatting
        null_ls.builtins.formatting.pint,
        null_ls.builtins.formatting.prettier.with({
            extra_args = { "--print-width", "120" },
        }),
        null_ls.builtins.formatting.black.with({
            extra_args = { "--line-length", "120" },
        }),
    }
})
