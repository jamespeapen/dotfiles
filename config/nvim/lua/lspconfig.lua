vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<F1>', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<F4>',
      function()
        vim.cmd(":write")
        vim.lsp.buf.rename()
      end,
      bufopts
    )

    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'd[', vim.diagnostic.get_prev, opts)
    vim.keymap.set('n', 'd]', vim.diagnostic.get_next, opts)

    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  end,
})

-- -- Bash
vim.lsp.enable('bashls')

-- C(++)
vim.lsp.enable('ccls')
vim.lsp.config('ccls', {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    }
  }
})

-- LateX
vim.lsp.enable('texlab')
vim.lsp.config('texlab', {
  filetypes = {"tex", "quarto"},
  settings = {
    texlab = {
      diagnostics = {
        ignoredPatterns = { "Underfull.*", "Overfull.*", "Undefined reference" }
      },
    },
  },
})

-- Lua
vim.lsp.enable('lua_ls')
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'bufopts', 'opts'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
--
-- Go
vim.lsp.enable("gopls")

-- Python
vim.lsp.enable("jedi_language_server")
vim.lsp.config("jedi_language_server", {
  filetypes = {"python"}
})

-- vim.lsp.enable("zuban")
-- vim.lsp.config("zuban", {
--   filetypes = {"python"}
-- })
-- vim.pyright.config("pyright", {
--   filetypes = {"python"},
--   settings = {
--     pyright = {
--       disableOrganizeImports = true,
--     }
--   },
--   python = {
--     analysis = {
--       ignore = { '*' },
--     }
--   }
-- })
-- vim.lsp.config("ruff", {
--   filetypes = {"python"}
-- })

-- Rust

-- R
vim.lsp.config("air", ({
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
}))
