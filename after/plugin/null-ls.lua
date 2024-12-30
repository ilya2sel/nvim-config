local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Formatting
        null_ls.builtins.formatting.pint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
    }
})
