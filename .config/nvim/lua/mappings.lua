local km = vim.keymap

-- Here is a utility function that closes any floating windows when you press escape
local function close_floating()
    for _, win in pairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative == "win" then
            vim.api.nvim_win_close(win, false)
        end
    end
end

km.set("n", "<Leader>u", ":Lazy update<CR>", { desc = "Lazy Update (Sync)" })

km.set("v", "y", "ygv<Esc>", { desc = "Yank and reposition cursor" })

local pluginKeys = {}
-- ===========================================
--   fzf-lua
-- ===========================================

--km.set("n", "<leader>p", require("fzf-lua").files, { desc = "FZF Files" })
km.set("n", "<F1>", require("fzf-lua").files, { desc = "FZF Files" })

km.set("n", "<leader><leader>", require("fzf-lua").resume, { desc = "FZF Resume" })

km.set("n", "<leader>r", require("fzf-lua").registers, { desc = "Registers" })

km.set("n", "<leader>m", require("fzf-lua").marks, { desc = "Marks" })

km.set("n", "<leader>k", require("fzf-lua").keymaps, { desc = "Keymaps" })

km.set("n", "<leader>f", require("fzf-lua").live_grep, { desc = "FZF Grep" })

km.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "FZF Buffers" })

km.set("n", "<leader>7", require("fzf-lua").grep_cword, { desc = "FZF Word" })

km.set("n", "<leader>j", require("fzf-lua").helptags, { desc = "Help Tags" })

km.set("n", "<leader>gc", require("fzf-lua").git_bcommits, { desc = "Browse File Commits" })

km.set("n", "<leader>gs", require("fzf-lua").git_status, { desc = "Git Status" })

km.set("n", "<leader>s", require("fzf-lua").spell_suggest, { desc = "Spelling Suggestions" })

km.set("n", "<leader>cj", require("fzf-lua").lsp_definitions, { desc = "Jump to Definition" })

km.set(
  "n",
  "<leader>cs",
  ":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>",
  { desc = "Document Symbols" }
)

km.set("n", "<leader>cr", require("fzf-lua").lsp_references, { desc = "LSP References" })

km.set(
  "n",
  "<leader>cd",
  ":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>",
  { desc = "Document Diagnostics" }
)

-- ===========================================
--   nvim-tree
-- ===========================================
km.set("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
km.set("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
    { key = { "o", "<2-LeftMouse>" }, action = "edit" },
    { key = "<CR>", action = "system_open" },
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    { key = "i", action = "toggle_ignored" },
    { key = ".", action = "toggle_dotfiles" },
    { key = "R", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "y", action = "copy_name" },
    { key = "Y", action = "copy_path" },
    { key = "gy", action = "copy_absolute_path" },
    { key = "I", action = "toggle_file_info" },
    { key = "n", action = "tabnew" },
    { key = { "]" }, action = "cd" },
    { key = { "[" }, action = "dir_up" },
}

-- ===========================================
--   nvim-tree
-- ===========================================
-- Switch between left / right tab
km.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
km.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

km.set("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)

km.set("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)
