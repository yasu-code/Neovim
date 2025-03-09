return {
    -- Lazy
    {
        "jackMort/ChatGPT.nvim",
        lazy = ture,
        cmd = { "ChatGPT" },
        config = function()
            require("chatgpt").setup({

            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim", -- optional
            "nvim-telescope/telescope.nvim"
        }
    }
}
