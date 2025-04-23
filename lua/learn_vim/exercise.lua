-- lua/learn_vim/exercise.lua

-- This module handles checking and resetting the current exercise,
-- and contains the logic for validating different exercise types.
-- It is structured as a function that is called with the parent module (M) from init.lua.

return function(M) -- Accept the parent module M as an argument
    local M_exercise = {} -- Local module table for exercise functions

    --- Check Current Exercise ---
    -- Called by the <Plug>(LearnVim_CheckExercise) mapping ('exc').
    -- Checks if the user has completed the current exercise correctly.
    function M_exercise.check_current_exercise()
         -- Ensure the command is run from within the exercise buffer.
         if vim.api.nvim_get_current_buf() ~= M.current_state.exercise_bufnr then -- Access buffer number via M.current_state
             vim.notify("Please switch to the exercise pane to check.", vim.log.levels.WARN)
             return
         end

         -- Get the current lesson and exercise data from the curriculum. Access curriculum via M.
         local lesson_data = M.curriculum['module' .. M.current_state.module] and M.curriculum['module' .. M.current_state.module]['lesson' .. M.current_state.lesson]
         if not lesson_data or not lesson_data.exercises or #lesson_data.exercises < M.current_state.exercise then
             vim.notify("No active exercise to check.", vim.log.levels.WARN)
             return
         end

         local current_exercise = lesson_data.exercises[M.current_state.exercise]

         -- Call the internal validation function to check completion.
         local is_completed = M_exercise.validate_exercise(current_exercise) -- Call local validation function

         if is_completed then
             -- Exercise completed successfully.
             vim.notify("Exercise completed! " .. (current_exercise.feedback or ""), vim.log.levels.INFO)
              -- Move to the next step (next exercise or next lesson).
              -- This delegates to the navigation module.
              M.next_lesson() -- Call navigation function via M

         else
             -- Exercise not yet complete.
             vim.notify("Exercise not yet complete. Keep trying!", vim.log.levels.INFO)
             -- Optional: provide hints based on partial validation results (more advanced).
         end
    end

    --- Reset Current Exercise ---
    -- Called by the <Plug>(LearnVim_ResetExercise) mapping ('exr').
    -- Resets the exercise buffer content and cursor to the starting state for the current exercise.
    function M_exercise.reset_current_exercise()
         -- Ensure the command is run from within the exercise buffer.
         if vim.api.nvim_get_current_buf() ~= M.current_state.exercise_bufnr then -- Access buffer number via M.current_state
             vim.notify("Please switch to the exercise pane to reset.", vim.log.levels.WARN)
             return
         end

         -- Get the current lesson and exercise data. Access curriculum via M.
         local lesson_data = M.curriculum['module' .. M.current_state.module] and M.curriculum['module' .. M.current_state.module]['lesson' .. M.current_state.lesson]
         if not lesson_data or not lesson_data.exercises or #lesson_data.exercises < M.current_state.exercise then
             vim.notify("No active exercise to reset.", vim.log.levels.WARN)
             return
         end

         local current_exercise = lesson_data.exercises[M.current_state.exercise]

         -- Reset the exercise buffer content using the original setup_text.
         if current_exercise.setup_text then
              local setup_lines = vim.split(current_exercise.setup_text, '\n', { plain = true })
              vim.api.nvim_buf_set_lines(M.current_state.exercise_bufnr, 0, -1, false, {}) -- Clear current content
              vim.api.nvim_buf_set_lines(M.current_state.exercise_bufnr, 0, 0, false, setup_lines) -- Set original content
              -- Reset cursor position if specified in the exercise data.
              if current_exercise.start_cursor then
                  vim.api.nvim_win_set_cursor(M.current_state.exercise_winid, current_exercise.start_cursor) -- Access window ID via M.current_state
              else
                  -- Default cursor to the start of the buffer if no specific position is given.
                  vim.api.nvim_win_set_cursor(M.current_state.exercise_winid, {1, 0})
              end
               -- Ensure the buffer remains modifiable after reset.
               vim.api.nvim_buf_set_option(M.current_state.exercise_bufnr, 'modifiable', true)
               vim.api.nvim_buf_set_option(M.current_state.exercise_bufnr, 'readonly', false)

              vim.notify("Exercise reset.", vim.log.levels.INFO)
         else
             -- Handle exercises that don't have a simple setup_text (e.g., pure mode changes).
             -- More complex reset logic might be needed per type, or just disallow reset.
              vim.notify("Cannot reset this exercise (no setup text defined).", vim.log.levels.WARN)
         end
    end

    --- Validate Exercise Completion ---
    -- This function contains the logic to check if an exercise is completed
    -- based on its defined type and validation rules.
    -- It is called internally by M_exercise.check_current_exercise().
    function M_exercise.validate_exercise(exercise_data)
        -- Get the exercise buffer and the window where validation was triggered.
        local exercise_buf = M.current_state.exercise_bufnr -- Access buffer number via M.current_state
        local current_win = vim.api.nvim_get_current_win() -- Window where 'exc' was pressed

        -- Implement validation logic based on the exercise type.
        if exercise_data.type == 'mode_switch' then
             -- For mode switch exercises, check the current mode.
             -- This assumes 'exc' was pressed *after* the user switched modes.
             if exercise_data.validation and exercise_data.validation.type == 'check_mode' then
                  local current_mode = vim.api.nvim_get_mode().mode -- Get the current Neovim mode
                  return current_mode == exercise_data.validation.target_mode
             end
             return false -- No valid validation defined for this type

        elseif exercise_data.type == 'insert_text' then
            -- For insert text exercises, check if the buffer content matches the target content.
            if exercise_data.validation and exercise_data.validation.type == 'check_buffer_content' then
                 -- Get all lines from the exercise buffer.
                 local current_lines = vim.api.nvim_buf_get_lines(exercise_buf, 0, -1, false)
                 -- Join the lines into a single string for comparison.
                 local current_content = table.concat(current_lines, '\n')
                 -- Perform a simple string comparison.
                 return current_content == exercise_data.validation.target_content
            end
            return false -- No valid validation defined for this type

        -- Add more validation types here as you implement more complex exercises:
        -- elseif exercise_data.type == 'cursor_move' then
        --     -- Check if the cursor is at a specific target position.
        --     if exercise_data.validation and exercise_data.validation.type == 'check_cursor_position' then
        --          -- Get the cursor position in the EXERCISE window.
        --          local current_cursor = vim.api.nvim_win_get_cursor(M.current_state.exercise_winid) -- Access window ID via M.current_state
        --          local target_c = exercise_data.validation.target_cursor
        --          -- Note: Nvim API uses 1-based line, 0-based column for cursor position.
        --          return current_cursor[1] == target_c[1] and current_cursor[2] == target_c[2]
        --      end
        --      return false
        -- elseif exercise_data.type == 'command' then
        --      -- Check if a specific command was executed.
        --      -- This requires intercepting or monitoring command line history, which is complex.
        --      vim.notify("Command validation not implemented yet.", vim.log.levels.WARN)
        --      return false -- Placeholder
        end

        -- Default case: if the exercise type is not recognized.
        vim.notify("Unknown exercise validation type: " .. tostring(exercise_data.type), vim.log.levels.ERROR)
        return false
    end

    -- Return the local module table containing the public functions.
    return M_exercise
end
