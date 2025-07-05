return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/nvim-cmp'},
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      
      local lsp_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
          })
        end
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        on_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      local lsp_opts = {
        on_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }

      require('lspconfig').c3_lsp.setup({
        cmd = { 
          "c3lsp",
          "-c3c-path", "/usr/bin/c3c",
          "-diagnostics-delay", "1000"
        },
        filetypes = { "c3" },
        root_dir = require("lspconfig.util").root_pattern("project.json"),
        on_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
      -- require('lspconfig').gleam.setup(lsp_opts)
      require('lspconfig').zls.setup(lsp_opts)
      -- require('lspconfig').ocamllsp.setup(lsp_opts)
      require('lspconfig').gopls.setup(lsp_opts)
      require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
      require('lspconfig').clangd.setup(lsp_opts)
      require('lspconfig').ols.setup(lsp_opts)
      -- require('lspconfig').denols.setup(lsp_opts)
      require('lspconfig').cssls.setup(lsp_opts)
      require('lspconfig').html.setup(lsp_opts)
      require('lspconfig').ts_ls.setup(lsp_opts)
      require("lspconfig").roc_ls.setup({lsp_opts})
      
      local cmp = require('cmp')
      cmp.setup({
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      })
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
          -- Automatically set inlay hints (type hints)
          -- There is an issue due to which the arguments are not shown
          inlay_hints = {
            auto = true,
          },
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- Custom keymaps for Rust
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set('n', '<leader>ra', function()
              vim.cmd.RustLsp('hover', 'actions')
            end, opts)
            vim.keymap.set('n', '<leader>rr', function()
              vim.cmd.RustLsp('runnables')
            end, opts)
            vim.keymap.set('n', '<leader>rd', function()
              vim.cmd.RustLsp('debuggables')
            end, opts)
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              checkOnSave = {
                enable = true,
                command = "clippy",
              },
              procMacro = {
                enable = true,
              },
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
              },
            },
          },
        },
        -- DAP configuration
        dap = {
          -- Configuration here
        },
      }
    end,
  },
}
