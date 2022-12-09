local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>gf', telescope.git_files, {})
vim.keymap.set('n', '<leader>rg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>b', telescope.buffers, {})
vim.keymap.set('n', '<leader>H', telescope.help_tags, {})

require("telescope").setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    bibtex = {
      context = true,
      context_fallback = true,
    },
  },
}

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 130,
        width = 0.6,
      },
      vertical = {
        height = 0.6,
        width = 0.7,
        preview_height = 0.5,
      },
      horizontal = {
        width = 0.8,
        preview_width = 0.5,
      },
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["Esc"] = actions.close,
        ["<M-u>"] = actions.preview_scrolling_up,
        ["<M-d>"] = actions.preview_scrolling_down,
      },
    },
  },
  pickers = {
    find_files = {
            find_command = {
                "rg",
                "-l", ".*",
                "--follow",
                "--hidden",
                "-g", "!.git/*",
            },
    },
  },
}

require('telescope').load_extension('fzf')
require("telescope").load_extension("file_browser")
require("telescope").load_extension("bibtex")
vim.keymap.set("i", "@@", function() vim.cmd('Telescope bibtex context=true') end)

function find_home()
    telescope.find_files {
        cwd = "~",
        find_command = {
            "rg",
            "-l", ".*",
            "--follow",
        },
    }
end

vim.keymap.set("n", "<Leader>fh", find_home)
