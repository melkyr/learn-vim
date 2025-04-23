-- lua/learn_vim/state.lua

-- This module handles loading and saving the tutorial progress state.
-- It is structured as a function that is called with the parent module (M) from init.lua.

return function(M) -- Accept the parent module M as an argument
    local M_state = {} -- Local module table for state functions

    --- State Loading ---
    -- Loads the tutorial progress from the JSON file.
    -- Checks if the file exists before attempting to read it.
    function M_state.load_progress()
        -- Check if the progress file exists and is readable using vim.fn.filereadable()
        -- filereadable() returns 1 if the file is readable, 0 otherwise.
        if vim.fn.filereadable(M.progress_file) == 1 then -- Access progress_file via M
            -- File exists, now attempt to read its content
            local content = vim.fn.readfile(M.progress_file)
            if #content > 0 then
                -- readfile returns a list of lines, join them into a single string
                local json_content = table.concat(content, '\n')
                -- Attempt to decode the JSON content
                local ok, state = pcall(vim.json.decode, json_content)
                if ok and state and type(state) == 'table' then
                    -- If decoding is successful and result is a table, merge it into the current state.
                    -- vim.tbl_deep_extend('keep', ...) merges tables, preferring existing values in the first table.
                    -- This is useful to preserve transient UI state (bufnr, winid) if the plugin is reloaded.
                    M.current_state = vim.tbl_deep_extend('keep', state, M.current_state) -- Access current_state via M
                    vim.notify("Loaded learning progress.", vim.log.levels.INFO)
                else
                    -- Handle decoding errors or invalid file content
                    vim.notify("Failed to decode learning progress from file: " .. tostring(state), vim.log.levels.WARN)
                    -- Optionally back up the corrupt file? Or just start fresh.
                    -- For now, we just warn and proceed with the default or previously loaded state.
                end
            -- else: file exists but is empty, start with default state (already initialized in M.current_state)
            end
        -- else: file does not exist or is not readable.
        -- This is expected on the first run. We simply do nothing, and the plugin
        -- will start with the default state { module = 1, lesson = 1, exercise = 1 }.
        -- The file will be created the first time save_progress is called.
        end
    end

    --- State Saving ---
    -- Saves the current tutorial progress to the JSON file.
    function M_state.save_progress()
        -- Create a copy of the state to save.
        -- Exclude volatile UI state (buffer and window IDs) as these are specific to the current session.
        local state_to_save = vim.tbl_deep_extend('keep', {}, M.current_state) -- Start with a copy of current state
        state_to_save.tutorial_bufnr = nil -- Remove UI fields
        state_to_save.exercise_bufnr = nil
        state_to_save.tutorial_winid = nil
        state_to_save.exercise_winid = nil

        -- Encode the state table into a JSON string
        local json_content = vim.json.encode(state_to_save)
        -- writefile expects a list of lines, so split the JSON string by newline
        local lines = vim.split(json_content, '\n')
        -- Attempt to write the lines to the progress file.
        -- writefile will create the file if it doesn't exist.
        local ok, err = pcall(vim.fn.writefile, lines, M.progress_file) -- Access progress_file via M
        if not ok then
            -- Handle file writing errors
            vim.notify("Failed to save learning progress: " .. tostring(err), vim.log.levels.ERROR)
        end
    end

    -- Return the local module table containing the public functions.
    return M_state
end
