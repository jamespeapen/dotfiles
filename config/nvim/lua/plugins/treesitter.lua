return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "cpp",
          "lua",
          "markdown_inline",
          "python",
          "r",
          "rnoweb",
          "rust",
          "vim",
          "vimdoc",
        },
        ignore_install = {
          "javascript"
        },
        highlight = {
          enable = true
        },
        sync_install = false,
        indent = {
          enable = true
        },
        incremental_selection = {
          enable = true,              -- false will disable the whole extension
          additional_vim_regex_highlighting = false,
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
              -- list_definitions = "gnd",
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
          }
        }
      })
    end
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
  { "nvim-treesitter/nvim-treesitter-refactor" },
}


