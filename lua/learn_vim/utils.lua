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

return Utils
```
