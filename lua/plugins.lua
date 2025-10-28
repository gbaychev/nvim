return {
    { 'RRethy/nvim-base16' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-web-devicons/nvim-web-devicons' },
        opts = {}
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                 ensure_installed = { "c", "lua", "vim", "help", "rust", "cpp", "go" },
                 sync_install = false,
                 ignore_install = { 'help' },
                 highlight = {
                   -- `false` will disable the whole extension
                    enable = true,
                 },
                 indent = { enable = true }
            })
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            local telescope = require('telescope')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            --vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "target", "node_modules", "build" },
                    layout_strategy = "horizontal",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    winblend = 0,
                }
            })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            vim.keymap.set('n', '<leader>fb', ":Neotree filesystem reveal float<CR>", {})
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    }
    --[[use {
        "zbirenbaum/copilot.lua",
        cmd = "copilot",
        event = "insertenter",
         config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end
    }[[--
    --[[use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end
    }]]--
}
