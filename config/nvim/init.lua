-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/vim/mappings.vim')
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/vim/settings.vim')
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/vim/autocorrect.vim')

require("config.lazy")
require("lspconfig")

