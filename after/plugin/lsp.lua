local lsp = require('lsp-zero')
local cmp = require('cmp')

vim.opt.signcolumn = 'yes'

lsp.preset('recommended')
lsp.ensure_installed {
    'rust_analyzer'
}

lsp.nvim_workspace()
lsp.setup()
--[[cmp.setup {
    completion = {
        autocomplete = false,
    }
}--]]

