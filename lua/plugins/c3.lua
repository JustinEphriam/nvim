return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- Add filetype recognition
            vim.filetype.add({
                extension = {
                    c3 = "c3",
                    c3i = "c3",
                    c3t = "c3",
                }
            })

            -- Configure the C3 parser
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.c3 = {
                install_info = {
                    url = "https://github.com/c3lang/tree-sitter-c3",
                    files = {"src/parser.c", "src/scanner.c"},
                    branch = "main",
                },
            }

            -- Add C3 to ensure_installed list
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "c3" })
        end,
    }
}
