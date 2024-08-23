local lsp = require('lsp-zero')
local cmp = require('cmp')

vim.opt.signcolumn = 'yes'

lsp.preset('recommended')
lsp.ensure_installed {
    'rust_analyzer'
}

lsp.nvim_workspace()
lsp.setup()

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

--[[cmp.setup({
    sources = {
        { name = "copilot", group_index = 2},
        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = 'buffer', group_index = 2 },
    },
    mapping = {
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
            else
                fallback()
            end
        end),
    },
})]]--

--[[cmp.setup {
    completion = {
        autocomplete = false,
    }
}--]]

