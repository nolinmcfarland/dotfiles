return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        ui.setup()
        require("dap-go").setup()
        require("nvim-dap-virtual-text").setup()

        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint) 
        vim.keymap.set("n", "<leader>gb", dap.run_to_cursor) 

        vim.keymap.set("n", "<leader>?", function()
            ui.eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<leader><Right>", dap.continue)
        vim.keymap.set("n", "<Right>", dap.step_over)
        vim.keymap.set("n", "<leader><Left>", dap.restart)
        vim.keymap.set("n", "<Left>", dap.step_back)
        vim.keymap.set("n", "<Down>", dap.step_into)
        vim.keymap.set("n", "<Up>", dap.step_out)

        dap.listeners.before.attach.dapui_config = function ()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function ()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function ()
            ui.open()
        end
        dap.listeners.before.event_exited.dapui_config = function ()
            ui.open()
        end
    end
}
