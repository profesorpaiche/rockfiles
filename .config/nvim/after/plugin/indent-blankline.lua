require("indent_blankline").setup {
    -- space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
    char = '┊',
    context_char = '┊',
    use_treesitter = false,
    use_treesitter_scope = false,
}

vim.keymap.set("n", "<leader>il", vim.cmd.IndentBlanklineToggle)
