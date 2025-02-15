return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    follow_current_file = true,
                    use_libuv_file_watcher = true,
                },
                window = {
                    width = 30,
                    mappings = {
                        ["<space>"] = "none",
                    },
                },
            })

            vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>Neotree focus<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Neotree reveal<CR>", { noremap = true, silent = true })
        end,
    },
    {
        "nathanaelkane/vim-indent-guides",
        init = function()
            vim.g.indent_guides_enable_on_vim_startup = 1
        end,
    },
    {
        "jacoborus/tender.vim",
        config = function()
            vim.cmd("colorscheme tender")
            -- Set termguicolors if available
            if vim.fn.has("termguicolors") == 1 then
                vim.opt.termguicolors = true
            end

            -- Highlight settings for C++ class scope
            vim.g.cpp_class_scope_highlight = 1

            -- Enable syntax and set colorscheme
            vim.cmd("syntax enable")
            vim.cmd("colorscheme tender")

            -- Custom highlights
            vim.api.nvim_set_hl(0, "Search", { fg = "grey", reverse = true })
            vim.api.nvim_set_hl(0, "Normal", { fg = "NONE" })
            vim.api.nvim_set_hl(0, "NonText", { fg = "NONE" })
            vim.api.nvim_set_hl(0, "SignColumn", { fg = "NONE" })

            -- Lightline and Airline theme
            vim.g.lightline = { colorscheme = "tender" }
            vim.g.airline_theme = "tender"
        end
    },
    {
        "sainnhe/everforest"
    },
    {
        "tpope/vim-endwise"
    },
    {
        "Townk/vim-autoclose"
    },
    {
        "tpope/vim-commentary"
    },
    {
        "airblade/vim-gitgutter",
        config = function()
            vim.opt.signcolumn = "yes"
            vim.opt.updatetime = 1000

            vim.api.nvim_set_keymap("n", "]g", ":GitGutterNextHunk<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "[g", ":GitGutterPrevHunk<CR>", { noremap = true, silent = true })
        end
    },
    {
        "tpope/vim-fugitive",
        lazy = true,
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>gd", ":Gdiff<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>gl", ":Gclog<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>ga", ":Git add %:p<CR><CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>gc", ":Gcommit<CR><CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>gp", ":Gpush<CR>", { noremap = true, silent = true })
        end
    },
    {
        "tpope/vim-surround"
    },
    {
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup {
                multi_windows = true,
            }
            vim.api.nvim_set_keymap("n", "<Leader><Leader>w", ":HopWord<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<Leader><Leader>l", ":HopLine<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<Leader><Leader>f", ":HopChar1<CR>", { noremap = true, silent = true })
        end
    },
    {
        "tpope/vim-repeat"
    },
    {
        "junegunn/vim-easy-align"
    },
    {
        "alvan/vim-closetag",
        config = function()
            vim.g.closetag_filenames = "*.html, *.js, *.jsx, *.php, *.tpl *.py"
        end
    },
    {
        "jiangmiao/auto-pairs"
    },
    {
        "vim-airline/vim-airline",
        config = function()
            vim.opt.laststatus = 2
            vim.g.airline_theme = "cobalt2"
            vim.g.airline_extensions_tabline_enabled = 1
            vim.g.airline_extensions_tabline_left_sep = " "
            vim.g.airline_extensions_tabline_left_alt_sep = "|"
            vim.g.airline_powerline_fonts = 1
        end
    },
    {
        "vim-airline/vim-airline-themes"
    },
    {
        "APZelos/blamer.nvim",
        config = function()
            vim.g.blamer_enabled = 1
            vim.g.blamer_delay = 1000
        end
    },
    {
        "ryanoasis/vim-devicons"
    },
    {
        "junegunn/fzf",
        build = "./install --bin"
    },
    {
        "junegunn/fzf.vim",
        depends = "fzf",
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>ff", ":GFiles<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>fgf", ":GFiles?<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>fb", ":Buffers<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>fh", ":History<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>fw", ":Windows<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>fr", ":Rg<CR>", { noremap = true, silent = true })
            -- Set FZF options
            vim.env.FZF_DEFAULT_OPTS = "--layout=reverse"
            vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**'"

            -- Configure FZF layout
            vim.g.fzf_layout = {
                up = '~90%',
                window = {
                    width = 0.8,
                    height = 0.8,
                    yoffset = 0.5,
                    xoffset = 0.5,
                    border = 'sharp'
                }
            }
        end
    },
    {
        "heavenshell/vim-jsdoc",
        config = function()
            vim.g.jsdoc_lehre_path = "~/.config/yarn/global/node_modules/lehre/bin/lehre"
        end
    },
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        "romgrk/barbar.nvim",
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>bn", ":BufferNext<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>bp", ":BufferPrevious<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>bc", ":BufferClose<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>br", ":BufferRestore<CR>", { noremap = true, silent = true })
        end
    },
    {
        "norcalli/nvim-colorizer.lua"
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup{
                size = 100,
                open_mapping = [[<c-t>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = 'float',
                close_on_exit = true,
            }
        end
    },
    {
        "goolord/alpha-nvim",
        -- dependencies = { 'echasnovski/mini.icons' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local startify = require("alpha.themes.startify")
            -- available: devicons, mini, default is mini
            -- if provider not loaded and enabled is true, it will try to use another provider
            startify.file_icons.provider = "devicons"
            require("alpha").setup(
                startify.config
            )
        end,
    },
}
