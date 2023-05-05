require("indent_blankline").setup {
    -- space_char_blankline = " ",
    show_current_context = false,
    show_current_context_start = false,
    show_trailing_blankline_indent = false,
    char = '┊',
    context_char = '┊',
    use_treesitter = false,
    use_treesitter_scope = false,
}

vim.keymap.set("n", "<leader>il", vim.cmd.IndentBlanklineToggle)
