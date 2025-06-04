-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function get_setup(name)
    return function()
        require("config." .. name)
    end
end

-- Set up Lazy.nvim
require("lazy").setup({
    { "nvim-tree/nvim-web-devicons" },
    { "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = get_setup("fzf"),

    },
    { "nvim-lua/plenary.nvim" }, -- Dependency for many plugins
--    { "tpope/vim-fugitive" },    -- Git integration
    { "nvim-tree/nvim-tree.lua" }, -- File explorer
    {
        "nvim-treesitter/nvim-treesitter",
        config = get_setup("treesitter"),
        build = ":TSUpdate",
        event = "BufReadPost",
    },
    { "folke/tokyonight.nvim" }, -- Theme
    { "ludovicchabant/vim-gutentags",
--        init = function()
--            vim.g.gutentags_modules = {"cscope_maps"} -- This is required. Other config is optional
--            vim.g.gutentags_cscope_build_inverted_index_maps = 1
--            vim.g.gutentags_cache_dir = vim.fn.expand("~/code/.gutentags")
--            vim.g.gutentags_file_list_command = "fd -e c -e h"
--            vim.g.gutentags_trace = 1
--        end,
    },

    {
        "dhananjaylatkar/cscope_maps.nvim",
        dependencies = {
            "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
            "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
        },
    },
    { "gbprod/yanky.nvim", opts = {}, },
    { "m4xshen/autoclose.nvim"},
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    { 'numToStr/Comment.nvim', opts = {}, },
    { 'lukoshkin/highlight-whitespace', config = true, },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "ibhagwan/fzf-lua",              -- optional
        },
    },
    {
        "folke/which-key.nvim",
        config = get_setup("which-key"),
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = get_setup("gitsigns"),
    },
})

-- Theme
require("tokyonight").setup()
vim.cmd("colorscheme tokyonight")

-- NvimTree setup
require("nvim-tree").setup()

-- Treesitter setup
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- Add languages as needed
  highlight = { enable = true },
  indent = { enable = true },
})

require('config')
-- Gtags
require('config.cscope_maps')
require('config.gtags_auto')
require('autoclose').setup()
require('Comment').setup()
require('ibl').setup()
require('mappings')
