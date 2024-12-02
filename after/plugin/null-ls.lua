local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            filetypes = {
                "javascript", "javascriptreact", "typescript", "typescriptreact",
                "vue", "html", "css", "scss", "yaml", "markdown", "json"
            }
        }),
        null_ls.builtins.formatting.pint.with({
            filetypes = { "php" }
        }),
        null_ls.builtins.formatting.google_java_format.with({
            filetypes = { "java" }
        }),
    }
})
