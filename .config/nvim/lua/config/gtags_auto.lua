
local uv = vim.loop

-- Helper to get mtime of a file
local function get_mtime(path)
    local stat = uv.fs_stat(path)
    return stat and stat.mtime.sec or 0
end

-- Find .git root
local git_dir = vim.fs.find('.git', { upward = true })[1]
if git_dir then
    local project_root = vim.fs.dirname(git_dir)
    local gtags_file = project_root .. '/GTAGS'
    local grtags_file = project_root .. '/GRTAGS'
    local gpath_file = project_root .. '/GPATH'

    -- Check if all tag files exist
    local tags_exist = uv.fs_stat(gtags_file) and uv.fs_stat(grtags_file) and uv.fs_stat(gpath_file)

    local should_run_gtags = false

    if not tags_exist then
        should_run_gtags = true
    else
        -- Get tag file mtime
        local tags_mtime = math.min(get_mtime(gtags_file), get_mtime(grtags_file), get_mtime(gpath_file))
        -- Scan for source files newer than tags (adjust extensions as needed)
        for _, file in ipairs(vim.fn.glob(project_root .. '/**/*.[ch]', true, true)) do
            if get_mtime(file) > tags_mtime then
                should_run_gtags = true
                break
            end
        end
    end

    if should_run_gtags then
        vim.fn.system({'gtags', project_root})
        vim.notify('gtags regenerated in ' .. project_root)
    else
        vim.notify('gtags up-to-date in ' .. project_root)
    end
end
