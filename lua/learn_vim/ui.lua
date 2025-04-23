-- lua/learn_vim/ui.lua

-- This module handles creating, updating, and managing the tutorial windows and buffers.
-- It is structured as a function that is called with the parent module (M) from init.lua.

return function(M) -- Accept the parent module M as an argument
    local M_ui = {} -- Local module table for UI functions

    --- UI Setup ---
    -- Creates or finds the tutorial buffers and windows.
    -- Ensures the UI is in a consistent state.
    -- This version replaces the current window with the exercise pane,
    -- then splits it ONCE for the tutorial pane.
    function M_ui.setup_tutorial_ui()
        -- Options for the tutorial text buffer (initially modifiable for setup)
         local tutorial_buf_opts = {
            listed = false,     -- Don't show in :ls
            scratch = true,     -- Don't associate with a file on disk
            bufhidden = 'hide', -- Hide buffer when its last window is closed
            swapfile = false,   -- Don't create a swap file for this buffer
            -- Initially modifiable, will be set to readonly/unmodifiable below
            modifiable = true,
            readonly = false,
        }
        -- Options for the exercise buffer (interactive, initially modifiable)
         local exercise_buf_opts = {
            listed = false, scratch = true, bufhidden = 'hide', swapfile = false,
            modifiable = true, -- Always modifiable initially for setup
            readonly = false,
         }

        -- Check if the tutorial buffer is valid. If not, create it.
        if not vim.api.nvim_buf_is_valid(M.current_state.tutorial_bufnr) then
            M.current_state.tutorial_bufnr = vim.api.nvim_create_buf(false, tutorial_buf_opts)
            vim.api.nvim_buf_set_name(M.current_state.tutorial_bufnr, '[LearnVim Tutorial]')
        end

        -- Check if the exercise buffer is valid. If not, create it.
        if not vim.api.nvim_buf_is_valid(M.current_state.exercise_bufnr) then
            M.current_state.exercise_bufnr = vim.api.nvim_create_buf(false, exercise_buf_opts)
             vim.api.nvim_buf_set_name(M.current_state.exercise_bufnr, '[LearnVim Exercise]')
        end

        -- Check if the tutorial and exercise windows are currently valid.
        local tutorial_win_valid = M.current_state.tutorial_winid ~= -1 and vim.api.nvim_win_is_valid(M.current_state.tutorial_winid)
        local exercise_win_valid = M.current_state.exercise_winid ~= -1 and vim.api.nvim_win_is_valid(M.current_state.exercise_winid)

        -- If either window is not valid, close any invalid ones and create new splits.
        if not tutorial_win_valid or not exercise_win_valid then
            -- Close invalid windows using pcall to avoid errors if they're already gone
            if tutorial_win_valid then pcall(vim.api.nvim_win_close, M.current_state.tutorial_winid, true) end
            if exercise_win_valid then pcall(vim.api.nvim_win_close, M.current_state.exercise_winid, true) end

            -- Get the current window. This is the window that will become the exercise pane.
            local current_win = vim.api.nvim_get_current_win()

            -- Set the exercise buffer into the current window. This replaces its content.
            vim.api.nvim_win_set_buf(current_win, M.current_state.exercise_bufnr)
            M.current_state.exercise_winid = current_win -- Store the ID of the now-exercise window

            -- Split the current window (which is now the exercise window) vertically.
            -- This creates the space for the tutorial window.
            vim.cmd('vsplit')
            -- The new window created by vsplit is now the current window.
            M.current_state.tutorial_winid = vim.api.nvim_get_current_win()
            -- Set the tutorial buffer into this new window.
            vim.api.nvim_win_set_buf(M.current_state.tutorial_winid, M.current_state.tutorial_bufnr)


            -- Set window options for cleanliness and usability in the tutorial panes.
            -- Tutorial window options (left pane)
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'wrap', false) -- Don't wrap lines
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'number', false) -- Hide line numbers
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'relativenumber', false) -- Hide relative line numbers
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'signcolumn', 'no') -- Hide sign column
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'foldcolumn', '0') -- Hide fold column
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'winfixwidth', true) -- Keep tutorial window width fixed
            vim.api.nvim_win_set_width(M.current_state.tutorial_winid, 40) -- Set a default width for the tutorial pane

            -- Exercise window options (right pane - the original window)
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'wrap', false) -- Don't wrap lines
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'number', true) -- Show line numbers in exercise pane
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'relativenumber', false) -- Hide relative line numbers
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'signcolumn', 'no') -- Hide sign column (can use for validation markers later)
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'foldcolumn', '0') -- Hide fold column

            -- Return focus to the exercise window so the user can start interacting.
             vim.api.nvim_set_current_win(M.current_state.exercise_winid)

            -- TODO: Add autocmds to clean up buffers if windows are manually closed?
            -- This is more complex and can be added later if needed.
            -- For now, rely on `bufhidden=hide` and recreating on :LearnVim start.
        else
             -- Windows were already valid. Ensure correct buffers are assigned
             -- (in case of weird state or manual buffer switching)
             vim.api.nvim_win_set_buf(M.current_state.tutorial_winid, M.current_state.tutorial_bufnr)
             vim.api.nvim_win_set_buf(M.current_state.exercise_winid, M.current_state.exercise_bufnr)

              -- Ensure buffer options are correct regardless of how window was reopened or options were changed
              -- Tutorial buffer should be read-only
              vim.api.nvim_buf_set_option(M.current_state.tutorial_bufnr, 'readonly', true)
              vim.api.nvim_buf_set_option(M.current_state.tutorial_bufnr, 'modifiable', false)
              vim.api.nvim_buf_set_option(M.current_state.tutorial_bufnr, 'wrap', false)
               vim.api.nvim_buf_set_option(M.current_state.tutorial_bufnr, 'bufhidden', 'hide') -- Ensure bufhidden is hide

              -- Exercise buffer should be modifiable by default
              vim.api.nvim_buf_set_option(M.current_state.exercise_bufnr, 'modifiable', true)
              vim.api.nvim_buf_set_option(M.current_state.exercise_bufnr, 'readonly', false)
              vim.api.nvim_buf_set_option(M.current_state.exercise_bufnr, 'wrap', false)
               vim.api.nvim_buf_set_option(M.current_state.exercise_bufnr, 'bufhidden', 'hide') -- Ensure bufhidden is hide


             -- Return focus to the exercise window
             vim.api.nvim_set_current_win(M.current_state.exercise_winid)
        end

        -- Re-apply key window options every time setup is called,
        -- in case they were changed by user actions or other plugins.
        vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'winfixwidth', true)
         vim.api.nvim_win_set_width(M.current_state.tutorial_winid, 40)
         vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'number', true) -- Show numbers in exercise pane

    end

    --- Display Lesson Content ---
    -- Populates the tutorial and exercise windows with content for the given lesson.
    function M_ui.display_lesson(module_id, lesson_id)
        -- Get the lesson data from the curriculum. Access curriculum via M.
        local lesson_data = M.curriculum['module' .. module_id] and M.curriculum['module' .. module_id]['lesson' .. lesson_id]
        if not lesson_data then
            vim.notify("Error: Lesson data not found for " .. module_id .. "." .. lesson_id, vim.log.levels.ERROR)
            -- TODO: Maybe close windows here if lesson data is critically missing?
            return
        end

        -- Ensure UI is set up before displaying content.
        M_ui.setup_tutorial_ui() -- Call local ui function

        -- 1. Update Tutorial Window (left pane)
        local tutorial_buf = M.current_state.tutorial_bufnr -- Access buffer number via M.current_state
        -- Ensure modifiable before writing
        vim.api.nvim_buf_set_option(tutorial_buf, 'modifiable', true)
        -- Clear previous content in the tutorial buffer.
        vim.api.nvim_buf_set_lines(tutorial_buf, 0, -1, false, {})
        -- Split the explanation text into lines and set the buffer content.
        local explanation_lines = vim.split(lesson_data.explanation, '\n', { plain = true })
        vim.api.nvim_buf_set_lines(tutorial_buf, 0, 0, false, explanation_lines)
         -- Set back to read-only and non-modifiable after writing.
        vim.api.nvim_buf_set_option(tutorial_buf, 'modifiable', false)
        vim.api.nvim_buf_set_option(tutorial_buf, 'readonly', true)
         vim.api.nvim_buf_set_option(tutorial_buf, 'bufhidden', 'hide') -- Ensure bufhidden is hide
        -- Scroll to the top of the tutorial window.
        vim.api.nvim_win_set_cursor(M.current_state.tutorial_winid, {1, 0}) -- Access window ID via M.current_state


        -- 2. Update Exercise Window (right pane)
        local exercise_buf = M.current_state.exercise_bufnr -- Access buffer number via M.current_state

        -- Ensure exercise buffer is modifiable before writing ANY content to it.
        vim.api.nvim_buf_set_option(exercise_buf, 'modifiable', true)
        vim.api.nvim_buf_set_option(exercise_buf, 'readonly', false)

        -- Clear previous content in the exercise buffer.
        vim.api.nvim_buf_set_lines(exercise_buf, 0, -1, false, {})


        -- Check if the lesson has exercises.
        if lesson_data.exercises and #lesson_data.exercises > 0 then
            -- Get the current exercise data based on the state.
            local current_exercise = lesson_data.exercises[M.current_state.exercise] -- Access current_state via M
            if not current_exercise then
                 -- Handle case where exercise index in state is invalid for this lesson.
                 vim.notify("Error: Exercise index " .. M.current_state.exercise .. " not found for lesson " .. module_id .. "." .. lesson_id, vim.log.levels.ERROR)
                 local no_exercise_lines = {
                    "--- Error Loading Exercise ---", "",
                    "Could not find exercise " .. M.current_state.exercise .. ".",
                    "Please report this bug or try :LearnVim next",
                 }
                 -- Ensure modifiable is true before writing the error message
                 vim.api.nvim_buf_set_option(exercise_buf, 'modifiable', true)
                 vim.api.nvim_buf_set_lines(exercise_buf, 0, 0, false, no_exercise_lines)
                  -- Then set it to non-modifiable after writing the error.
                  vim.api.nvim_buf_set_option(exercise_buf, 'modifiable', false)
                  vim.api.nvim_buf_set_option(exercise_buf, 'readonly', true)
                  vim.api.nvim_buf_set_option(exercise_buf, 'bufhidden', 'hide')
                  vim.api.nvim_set_current_win(M.current_state.tutorial_winid) -- Focus tutorial pane on error
                 return
            end

            -- Set up exercise text if provided in the curriculum data.
            -- The setup_text is expected to include the header comments now.
            if current_exercise.setup_text then
                local setup_lines = vim.split(current_exercise.setup_text, '\n', { plain = true })
                -- Ensure modifiable is true before writing setup text
                 vim.api.nvim_buf_set_option(exercise_buf, 'modifiable', true)
                vim.api.nvim_buf_set_lines(exercise_buf, 0, 0, false, setup_lines)

                 -- Set cursor position if requested by the exercise data.
                 if current_exercise.start_cursor then
                     vim.api.nvim_win_set_cursor(M.current_state.exercise_winid, current_exercise.start_cursor) -- Access window ID via M.current_state
                 else
                      -- Default cursor to the start of the buffer if no specific position is given.
                       vim.api.nvim_win_set_cursor(M.current_state.exercise_winid, {1, 0})
                 end
            else
                 -- If no setup text, just show the instruction header.
                 local instruction_lines = {
                     '" --- Exercise ' .. module_id .. '.' .. lesson_id .. '.' .. M.current_state.exercise .. ' ---',
                     '" Instruction: ' .. current_exercise.instruction,
                     '" Use \'exc\' to check, \'exr\' to reset.', -- Remind them how to check/reset
                     '" ---------------------------------------------', '',
                 }
                 -- Ensure modifiable is true before writing instruction header
                 vim.api.nvim_buf_set_option(exercise_buf, 'modifiable', true)
                 vim.api.nvim_buf_set_lines(exercise_buf, 0, 0, false, instruction_lines)
                 -- Place cursor after the header.
                 vim.api.nvim_win_set_cursor(M.current_state.exercise_winid, {5, 0})
            end

            -- Ensure exercise buffer is modifiable for user interaction.
            vim.api.nvim_buf_set_option(exercise_buf, 'modifiable', true)
            vim.api.nvim_buf_set_option(exercise_buf, 'readonly', false)
             vim.api.nvim_buf_set_option(exercise_buf, 'bufhidden', 'hide') -- Ensure bufhidden is hide

            -- Ensure focus is on the exercise window.
             vim.api.nvim_set_current_win(M.current_state.exercise_winid) -- Access window ID via M.current_state

             -- TODO: Potentially set up autocmds/mappings specific to this exercise type? (Deferred)

        else
            -- If there are no exercises for this lesson, display a message in the exercise pane.
            local no_exercise_lines = {
                "--- No Exercise ---", "",
                "This lesson was informational.",
                "Type :LearnVim next to continue.",
            }
            -- Ensure modifiable is true BEFORE writing the "No Exercise" message.
            vim.api.nvim_buf_set_option(exercise_buf, 'modifiable', true)
            -- Content is already cleared above. Set the message lines.
            vim.api.nvim_buf_set_lines(exercise_buf, 0, 0, false, no_exercise_lines)
            -- Make the exercise buffer non-modifiable as there's nothing to do.
            vim.api.nvim_buf_set_option(exercise_buf, 'modifiable', false) -- Set modifiable to false AFTER writing
            vim.api.nvim_buf_set_option(exercise_buf, 'readonly', true)
            vim.api.nvim_buf_set_option(exercise_buf, 'bufhidden', 'hide')

            -- Focus the tutorial window if there's no exercise to interact with.
             vim.api.nvim_set_current_win(M.current_state.tutorial_winid) -- Access window ID via M.current_state

            vim.notify("Lesson " .. module_id .. "." .. lesson_id .. " loaded. No exercises.", vim.log.levels.INFO)
        end
    end

    -- Return the local module table containing the public functions.
    return M_ui
end
