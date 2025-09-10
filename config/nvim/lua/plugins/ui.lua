return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      contrast = "hard", -- can be "hard", "soft" or empty string
    },
    init = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    'ap/vim-css-color',
    ft = {
      'css',
      'rmd',
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },
  {
    "kshenoy/vim-signature",
  },
}
