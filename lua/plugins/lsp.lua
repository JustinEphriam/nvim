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
      -- Set up the LSP attach function to define keybindings
      local lsp_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        -- LSP-related keybindings
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
        -- Enable format on save
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
          })
        end
      end
      -- Extend lsp-zero with LSP configurations
      lsp_zero.extend_lspconfig({
        sign_text = true,
        on_attach = lsp_attach,  -- Attach custom keybindings
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      -- Common LSP setup options
      local lsp_opts = {
        on_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }

      -- Rust LSP
      require('lspconfig').rust_analyzer.setup(lsp_opts)
      -- Set up Go LSP (gopls)
      require('lspconfig').gopls.setup(lsp_opts)

      -- Set up Zig LSP (zls)
      require('lspconfig').zls.setup(lsp_opts)

      -- Set up Lua LSP (lua_ls)
      require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

      -- Set up C LSP (C)
      require('lspconfig').clangd.setup({lsp_opts})
      -- Ocaml lsp
      require('lspconfig').ocamllsp.setup({lsp_opts})
      -- Deno LSP
      -- require('lspconfig').denols.setup({lsp_opts})
      -- TS, HTML, CSS
      require('lspconfig').ts_ls.setup(lsp_opts)
      require('lspconfig').cssls.setup(lsp_opts)
      require('lspconfig').html.setup(lsp_opts)
      -- Completion setup
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
}










