local configs = require("nvim-treesitter.configs")

configs.setup {
    ensure_installed = {"python", "r", "lua", "bash", "julia", "vim"},
    sync_install = false,
    ignore_install = { "" }, -- List of parsers to ignore installing, the built-in highlight will be used
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled, use default
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml", "julia" } },
    autopairs = { enable = true },
}
