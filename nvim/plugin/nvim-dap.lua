-- Debug settings if you're using nvim-dap
local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup()

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set('n', '<leader>dt', ":lua require('dapui').toggle()<CR>", { noremap = true,  desc = '[d]ap ui [t]oggle' })
vim.keymap.set('n', '<leader>db', ":DapToggleBreakpoint<CR>", { noremap = true,  desc = '[d]ap toggle [b]reakpoint' })
vim.keymap.set('n', '<leader>dc', ":DapContinue<CR>", { noremap = true,  desc = '[d]ap [c]ontinue' })
vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset = true})<CR>", { noremap = true,  desc = '[d]ap ui [r]eset ui' })

