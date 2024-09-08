return {
  {
    'lewis6991/gitsigns.nvim',
    event = "InsertEnter",
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '  <author>, <author_time:%Y-%m-%d> - <summary>',
    },
    init = function()
      vim.cmd([[highlight link GitSignsCurrentLineBlame GruvboxFg3]])
    end
  },
  {
    'AndrewRadev/linediff.vim',
    cmd = "Linediff",
  },
  {
    'tpope/vim-fugitive',
    cmd = "Git"
  }
}
