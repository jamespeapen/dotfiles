return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require('lspconfig')

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
          vim.keymap.set('n', 'd[', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', 'd]', vim.diagnostic.goto_next, opts)

          vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        end,
      })
      -- -- Bash
      nvim_lsp.bashls.setup{}

      -- C(++)
      nvim_lsp.ccls.setup {
        init_options = {
          cache = {
            directory = ".ccls-cache";
          }
        }
      }

      -- LateX
      nvim_lsp.texlab.setup {
        filetypes = {"tex", "quarto"},
        settings = {
          texlab = {
            diagnostics = {
              ignoredPatterns = { "Underfull.*", "Overfull.*", "Undefined reference" }
            },
          },
        },
      }

      -- Lua
      nvim_lsp.lua_ls.setup {
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
      }
      --
      -- Go
      nvim_lsp.gopls.setup{}

      -- Python
      nvim_lsp.jedi_language_server.setup {
        filetypes = {"python"}
      }
      -- nvim_lsp.pyright.setup {
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
      -- }
      -- nvim_lsp.ruff.setup {
      --   filetypes = {"python"}
      -- }
      --
      -- -- Rust
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
              extraArgs = {
                { "--target-dir", "/tmp/rust-analyzer-check" }
              }
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

      -- R
      require("lspconfig").air.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end,
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        sources = cmp.config.sources({
          { name = 'orgmode' },
          { name = 'nvim_lsp' },
          { name = 'ultisnips' },
          { name = 'cmp_r' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lsp_signature_help' },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<M-u>"] = cmp.mapping.scroll_docs(-4),
          ["<M-d>"] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
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
    end
  },
}

