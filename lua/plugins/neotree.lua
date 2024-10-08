return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x", -- Ensure you're using the correct version
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Optional, for file icons
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true, -- Change this to match the new option structure
            leave_dirs_open = false, -- Optional, adjust based on your preference
          },
          hijack_netrw_behavior = "open_default",
          use_libuv_file_watcher = true, -- Automatically updates the tree when files change
        },
        -- Other Neotree options...
      })

      -- Optional: Keybinding to toggle Neotree
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle NeoTree' })
    end,
  }
}

