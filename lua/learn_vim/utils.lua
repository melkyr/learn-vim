-- lua/learn_vim/utils.lua

-- This module provides utility functions for the LearnVim plugin.

local Utils = {}

--- Sets multiple buffer options at once.
-- @param bufnr (integer) The buffer number.
-- @param options (table) A table where keys are option names (strings)
--                        and values are the option values.
-- Example: Utils.set_buffer_options(my_buf, { bufhidden = 'wipe', buftype = 'nofile' })
function Utils.set_buffer_options(bufnr, options)
    if type(bufnr) ~= 'number' or type(options) ~= 'table' then
        vim.notify("Error: Invalid arguments to set_buffer_options. Bufnr must be a number and options must be a table.", vim.log.levels.ERROR)
        return
    end

    for key, value in pairs(options) do
        -- Use pcall to catch errors if an option name is invalid or value is incorrect
        local success, err = pcall(vim.api.nvim_buf_set_option, bufnr, key, value)
        if not success then
            vim.notify("Error setting buffer option '" .. key .. "': " .. tostring(err), vim.log.levels.ERROR)
        end
    end
end

--- Reads the content of a file.
-- @param file_path (string) The path to the file.
-- @return (string|nil) The file content as a string, or nil if an error occurred.
function Utils.read_file_content(file_path)
    if type(file_path) ~= 'string' then
        vim.notify("Error: Invalid argument to read_file_content. file_path must be a string.", vim.log.levels.ERROR)
        return nil
    end

    local file, err_open = io.open(file_path, "r")
    if not file then
        vim.notify("Error opening file '" .. file_path .. "': " .. tostring(err_open), vim.log.levels.ERROR)
        return nil
    end

    local content, err_read = file:read("*a")
    if not content and err_read then -- Check for actual read error, not just empty file
        vim.notify("Error reading file '" .. file_path .. "': " .. tostring(err_read), vim.log.levels.ERROR)
        file:close() -- Still attempt to close
        return nil
    end

    local ok_close, err_close = file:close()
    if not ok_close then
        vim.notify("Error closing file '" .. file_path .. "': " .. tostring(err_close), vim.log.levels.WARN)
        -- Continue, as content was read, but warn about closing issue.
    end

    return content
end

return Utils
