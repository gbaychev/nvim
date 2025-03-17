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

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "target", "node_modules" },
                    layout_strategy = "horizontal",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    winblend = 0,
                }
            })
        end,
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            vim.keymap.set('n', '<leader>db','<cmd> DapToggleBreakpoint<CR>')
            vim.keymap.set('n', '<leader>dui',function()
                local widgets = require('dap.ui.widgets')
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open()
            end)
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("dap-go").setup()
        end
    },
    --[[{
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end
    },]]--
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
