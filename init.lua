require("config.lazy")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backspace={'indent', 'eol', 'start'}
vim.opt.confirm = true
vim.opt.visualbell = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 200
--vim.opt.pastetoggle = '<F11>'
vim.opt.listchars = 'eol:¬,tab:>·,trail:·,extends:>,precedes:<,space:·'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "130"
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<F5>', ':set list!<CR>', {expr = false, silent=true} )
vim.api.nvim_set_keymap('n', '<C-L>', ':nohl<CR>', {expr = false, silent=true} )
--vim.api.nvim_set_keymap('n', '<space>', 'i<space><esc>', {expr = false, silent=true} )
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', {expr = false} )
vim.api.nvim_set_keymap('n', '<C-p>', ':bprevious<CR>', {expr = false} )
vim.api.nvim_set_keymap('c', 'W', 'w', {expr = false, silent=true} )
vim.api.nvim_set_keymap('c', 'Q', 'q', {expr = false, silent=true} )

vim.api.nvim_create_autocmd(
    {'FileType'},
    {
        pattern = "go",
        callback = function()
            vim.schedule(function ()
                vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', ':!go build<CR>', {expr = false})
            end)
        end
    })

vim.api.nvim_create_autocmd(
    {'FileType'},
    {
        pattern = "cpp,c,cppm,h",
        callback = function()
            vim.schedule(function ()
                vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', ':! cmake --build ./build<CR>', {expr = false})
            end)
        end
    })

os_name = vim.loop.os_uname().sysname

if string.find(os_name, "Windows") then
    vim.g.clipboard = {
                        name = 'WslClipboard',
                        copy = {
                          ['+'] = 'clip.exe',
                          ['*'] = 'clip.exe'
                        },
                        paste = {
                          ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                          ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
                        },
                        cache_enabled = false,
                     }
    vim.opt.guifont = "CaskaydiaCove NF:h11"
    vim.g.copilot_assume_mapped = true
end

vim.cmd('colorscheme base16-monokai', { silent = true})


