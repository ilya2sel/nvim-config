require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "java", "javascript", "typescript", "comment", "c", "dockerfile",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "json", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
        "xml", "yaml", "python", "vue", "php"
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
}
