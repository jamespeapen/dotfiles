" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python"}, -- one of "all", "maintained"
  ignore_install = { "javascript"}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust", "r" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,              -- false will disable the whole extension
    disable = { "python", "c", "rust" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  refactor = {
    highlight_definitions = { enable = true },
    navigation = {
        \ enable = true,
        keymaps = {
            \ goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "g0",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          \ }
      \ }
  },
}
EOF
