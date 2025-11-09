return {
    {
        "github/copilot.vim",
        cmd = { "Copilot" },
        config = function()
            -- Neovim を開いたときは Copilot を OFF にする
            vim.g.copilot_enabled = false

            -- Copilot の提案を <C-Y> で受け入れる
            vim.api.nvim_set_keymap("n", "<C-Y>", 'copilot#Accept()', { expr = true, silent = true})
            vim.api.nvim_set_keymap("i", "<C-Y>", 'copilot#Accept()', { expr = true, silent = true})
            -- Copilot のデフォルトの <Tab> キーマッピングを無効化
            vim.g.copilot_no_tab_map = true

            -- Tab を CoC の補完に使う（CoC が表示されている場合は補完、そうでなければ通常の Tab）
            vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() == 1 ? coc#pum#next(1) : "\<Tab>"]], { expr = true, silent = true })
            -- Shift + Tab で補完選択肢を戻る
            vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() == 1 ? coc#pum#prev(1) : "\<S-Tab>"]], { expr = true, silent = true })

            -- Copilot の提案を <C-J> で次の提案に、<C-K> で前の提案に移動
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Next()', { expr = true, silent = true })
            vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Previous()', { expr = true, silent = true })

            -- Copilot の提案を <C-P> で表示
            vim.api.nvim_set_keymap("n", "<leader>cp", ":Copilot panel<CR>", { noremap = true, silent = true })
        end
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on them
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>cc", ':CopilotChatToggle<CR>', { noremap = true, silent = true})
            require('CopilotChat').setup({
                prompts = {
                    Explain = {
                        prompt = '選択したコードの説明を日本語で書いてください',
                        mapping = '<leader>ce',
                    },
                    Review = {
                        prompt = 'コードを日本語でレビューしてください',
                        mapping = '<leader>cr',
                    },
                    Fix = {
                        prompt = 'このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします',
                        mapping = '<leader>cf',
                    },
                    Optimize = {
                        prompt = '選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします',
                        mapping = '<leader>co',
                    },
                    Docs = {
                        prompt = '選択したコードに関するドキュメントコメントを日本語で生成してください',
                        mapping = '<leader>cd',
                    },
                    Tests = {
                        prompt = '選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします',
                        mapping = '<leader>ct',
                    },
                },
            })
        end,
        -- keys = {
        --     {
        --         '<leader>cc',
        --         function()
        --             require('CopilotChat').toggle()
        --         end,
        --         desc = 'CopilotChat - Toggle',
        --     },
        --     {
        --         '<leader>cch',
        --         function()
        --             local actions = require('CopilotChat.actions')
        --             require('CopilotChat.integrations.telescope').pick(actions.help_actions())
        --         end,
        --         desc = 'CopilotChat - Help actions',
        --     },
        --     { 
        --         '<leader>ccp',
        --         function()
        --             local actions = require('CopilotChat.actions')
        --             require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
        --         end,
        --         desc = 'CopilotChat - Prompt actions',
        --     },
        -- },
    }
}
