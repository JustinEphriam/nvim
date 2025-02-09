return {

  { 
    "rebelot/kanagawa.nvim", name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent =  true, -- enable transparency if desired
        globalStatus = true, -- enable global statusline
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none", -- make the line number gutter transparent
              },
            },
          },
        },
      })
      vim.cmd("colorscheme kanagawa-wave")
      
      -- Ensure the line numbers have a transparent or matching background
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })  -- line numbers background
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" }) -- current line number
    end,
  },

}
