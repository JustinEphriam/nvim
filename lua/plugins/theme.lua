return {
    { 
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                transparent = true,
                globalStatus = true,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                            },
                        },
                    },
                },
            })
            vim.cmd("colorscheme kanagawa-wave")
            vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
        end,
    },
}

-- theme = Ayu Mirage
-- font-family = "Monaspace Argon SemiBold"
-- font-size = 16
-- cursor-style = "block"
-- cursor-style-blink = true
-- mouse-hide-while-typing = true
-- window-vsync = true
-- background-opacity = 1.0
-- command = /usr/bin/nu
-- keybind = shift+enter=text:\n
