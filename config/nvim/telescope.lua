local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>H', builtin.help_tags, {})


require("telescope").load_extension("bibtex")
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

require('telescope').load_extension('fzf')
require("telescope").load_extension("file_browser")

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    layout_config = {
      width = 0.7,
      preview_width = 0.6,
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
                "--follow",
                "--files",
                "--hidden",
                "-g", "!.git/*",
                "-g", "!*.docx",
                "-g", "!*.o",
                "-g", "!*.png",
                "-g", "!*.pdf",
            },
    },
  },
}


vim.keymap.set("i", "@@", function() vim.cmd('Telescope bibtex') end)
