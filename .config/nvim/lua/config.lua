vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.termguicolors = true

vim.opt.cindent = true

-- General settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.tabstop = 4            -- 4 spaces for tabs
vim.opt.shiftwidth = 4         -- 4 spaces for indent
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.autoindent = true
vim.opt.smartindent = true     -- Smart indentation
vim.opt.termguicolors = true   -- Enable true colors

--

vim.opt.encoding ='utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileformats = 'unix,dos'

--

-- ========================= --
-- gutentags
-- ========================= --
vim.g.gutentags_modules = {'ctags'}
vim.g.gutentags_auto_gtags_cscope = 0
vim.env.GTAGSLABEL = 'native-pygments'

-- vim.g.gutentags_modules = {'gtags-cscope'}
vim.g.gutentags_project_root = {'.git', 'Makefile', 'CMakeLists.txt'}
vim.g.gutentags_ctags_extra_args = {'--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px'}
--vim.g.gutentags_gtags_executable = 'gtags'
--vim.g.gutentags_gtags_cscope_executable = 'gtags-cscope'

-- Ensure tags directory exists
if not vim.fn.isdirectory(vim.fn.expand('~/.cache/tags')) then
    vim.fn.mkdir(vim.fn.expand('~/.cache/tags'), 'p')
    vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/tags')
end

vim.g.gutentags_trace = 0
vim.g.gutentags_define_advaanced_command=0

-- Remember the last position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

