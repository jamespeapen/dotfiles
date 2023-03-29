-- mason setup
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "jedi_language_server",
        "texlab",
    },
}


-- bindings
local lsp_attach = function(client, bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Ctrl-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', 'd]', vim.diagnostic.goto_next, opts)
end


-- Cmp
local cmp = require'cmp'
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup({
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor'},
    },
    confirmation = {
        completeopt = "menu,menuone,noinsert"
    },
    snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<M-u>"] = cmp.mapping.scroll_docs(-4),
      ["<M-d>"] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
    }),
    experimental = {
        ghost_text = true
    }

})

cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- mason LSP setup
local nvim_lsp = require'lspconfig'

require('mason-lspconfig').setup_handlers({
  function(server_name)
    nvim_lsp[server_name].setup({
      on_attach = lsp_attach,
      capabilities = cmp_capabilities,
    })
  end,
})

-- LateX
nvim_lsp.texlab.setup{
    filetypes = {"latex", "quarto"}
}


-- R
nvim_lsp.r_language_server.setup{
    filetypes = {"quarto", "r", "rmd"}
}

-- Rust
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    settings = {
      imports = {
          granularity = {
              group = "module",
          },
          prefix = "self",
      },
      checkOnSave = {
          command = "clippy",
      },
      cargo = {
          buildScripts = {
              enable = true,
          },
      },
      procMacro = {
          enable = true
      },
    }
  },
})

-- ccls
nvim_lsp.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}

