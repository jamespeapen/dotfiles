return {
  {
    "AndrewRadev/splitjoin.vim",
    init = function()
      vim.g.r_indent_align_args = 0
      vim.g.splitjoin_c_argument_split_first_newline = 1
      vim.g.splitjoin_python_brackets_on_separate_lines = 1
    end
  },
  'tpope/vim-surround',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local cmp = require'cmp'
      require("nvim-autopairs").setup {}
      require('nvim-autopairs').remove_rule('`')
      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  }
}

