dap_common = {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require('dap')
        local utils = require('dap.utils')
        local rpc = require('dap.rpc')

        local function send_payload(client, payload)
          local msg = rpc.msg_with_content_length(vim.json.encode(payload))
          client.write(msg)
        end

        function RunHandshake(self, request_payload)
          local signResult = io.popen('node D:\\tools\\debugger\\sign.js ' .. request_payload.arguments.value)
          if signResult == nil then
            utils.notify('error while signing handshake', vim.log.levels.ERROR)
            return
          end
          local signature = signResult:read("*a")
          signature = string.gsub(signature, '\n', '')
          local response = {
            type = "response",
            seq = 0,
            command = "handshake",
            request_seq = request_payload.seq,
            success = true,
            body = {
              signature = signature
            }
          }
          send_payload(self.client, response)
        end

        dap.adapters.cppvsdbg = {
            id = 'cppvsdbg',
            type = 'executable',
            -- command = 'D:\\tools\\debugger\\debugAdapters\\bin\\OpenDebugAD7.exe',
            -- https://github.com/mfussenegger/nvim-dap/discussions/869
            command = 'D:\\tools\\debugger\\debugAdapters\\vsdbg\\bin\\vsdbg.exe',
            args = { "--interpreter=vscode" },
            options = {
                externalTerminal = true,
            -- logging = {
            --   moduleLoad = false,
            --   trace = true
            -- }
            },
            runInTerminal =  true,
            reverse_request_handlers = {
                handshake = RunHandshake,
            }
        }

        vim.keymap.set('n', '<leader>db','<cmd> DapToggleBreakpoint<CR>')
        vim.keymap.set('n', '<leader>dui',function()
            local widgets = require('dap.ui.widgets')
            local sidebar = widgets.sidebar(widgets.scopes)
            sidebar.open()
        end)
    end
}

dap_go =     {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
        require("dap-go").setup()
    end
}

dap_ui = { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }


return  {
    dap_common,
    dap_go,
    dap_ui
}
