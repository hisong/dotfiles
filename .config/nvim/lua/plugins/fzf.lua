return {
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        cmd = "FzfLua",
        keys = {
            {
                "<Leader>ff",
                function()
                    require("fzf-lua").files()
                end,
                desc = "Find files",
            },
            {
                "<Leader>fg",
                function()
                    require("fzf-lua").live_grep()
                end,
                desc = "Live grep",
            },
            {
                "<Leader>fb",
                function()
                    require("fzf-lua").buffers()
                end,
                desc = "Buffers",
            },
            {
                "<Leader>fh",
                function()
                    require("fzf-lua").help_tags()
                end,
                desc = "Help tags",
            },
        },
        opts = {
            winopts = {
                border = "rounded",
            },
        },
    },
}
