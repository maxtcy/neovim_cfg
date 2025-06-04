require('cscope_maps').setup({
        cscope = {
            exec = "gtags-cscope",
--            db_file = "./GTAGS",
            picker = "fzf-lua",
        },
})

local group = vim.api.nvim_create_augroup("CscopeBuild", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
  callback = function() vim.cmd("Cscope db build") end,
  group = group,
})
