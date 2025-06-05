local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("There is no bufferline")
    return
end
-- https://github.com/akinsho/bufferline.nvim#configuration
require('bufferline').setup({
    options = {
        close_command = "Bdelete! %d", -- 关闭 Tab 的命令
        right_mouse_command = "Bdelete! %d",
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            }
        },
    --     diagnostics = "nvim_lsp",
    --     ---@diagnostic disable-next-line: unused-local
    --     diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --         local s = " "
    --         for e, n in pairs(diagnostics_dict) do
    --             local sym = e == "error" and " " or (e == "warning" and " " or "")
    --             s = s .. n .. sym
    --         end
    --         return s
    --     end,
    },
})
