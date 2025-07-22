
return {

    { 
        "catppuccin/nvim", name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
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
            vim.cmd("colorscheme catppuccin-latte")

            -- Ensure the line numbers have a transparent or matching background
            vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })  -- line numbers background
            vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" }) -- current line number
        end,
    },

}
