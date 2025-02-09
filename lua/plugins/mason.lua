return {
  {
    'williamboman/mason.nvim',
    build = ":MasonUpdate", -- Ensure mason is up to date when updating plugins
    config = function()
      require("mason").setup({
        -- Customize Mason settings here (optional)
        ui = {
          border = "rounded", -- Rounded borders for the Mason UI
        },
      })
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- List the LSP servers you want automatically installed
          -- "lua_ls",      -- Lua
          -- "html",        -- HTML
          -- "cssls",       -- CSS
          "gopls",    -- Elixir
        },
        automatic_installation = true, -- Automatically install configured servers
      })

      -- Setup LSP servers using lspconfig after mason installs them

    end,
  },
}

