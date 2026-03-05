return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
      local ts = require("nvim-treesitter")
      langs = {
        "cpp",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "r",
        "rnoweb",
        "rust",
        "vim",
        "vimdoc",
        "yaml",
      }
      ts.install(langs)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = langs,
        callback = function() vim.treesitter.start() end,
      })
    end
  },
  {
    'MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-s>",
          node_incremental = "<a-n>",
          scope_incremental = "<a-c>",
          node_decremental = "<a-p>",
        },
      },
      refactor = {
        highlight_definitions = { enable = true },
        navigation = {
          enable = true,
          keymaps = {
            list_definitions = "gnd",
            list_definitions_toc = "g0",
            goto_next_usage = "g]",
            goto_previous_usage = "g[",
          }
        },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    init = function()
      vim.cmd([[hi TreesitterContextBottom gui=underline guisp=Grey]])
      vim.cmd([[hi TreesitterContextLineNumberBottom gui=underline guisp=Grey]])
    end,
    opts = {
      multiwindow = true,
      max_lines = 5,
      multiline_threshold = 2,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-locals",
    enabled = false,
  },
}


