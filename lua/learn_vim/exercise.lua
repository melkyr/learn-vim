-- lua/learn_vim/exercise.lua

-- This module handles the logic for managing and validating exercises.

local M = {} -- The module table
local Utils = require('learn_vim.utils') -- Require the utils module
local LEARN_VIM = nil -- Placeholder for the main plugin module, set during setup

-- --- Setup Function ---
-- This function is called from init.lua to provide access to the main plugin module.
function M.setup(learn_vim_module)
    LEARN_VIM = learn_vim_module
    return M
end

--- Loads and displays the current exercise.
function M.load_current_exercise()
    local state = LEARN_VIM.current_state
    local module_data = LEARN_VIM.curriculum['module' .. state.module]

    if not module_data then
        vim.notify("Error: Module " .. state.module .. " not found.", vim.log.levels.ERROR)
        return
    end

    local lesson_data = module_data['lesson' .. state.lesson]
    if not lesson_data then
        vim.notify("Error: Lesson " .. state.lesson .. " not found in Module " .. state.module .. ".", vim.log.levels.ERROR)
        return
    end

    local exercise_data = lesson_data.exercises and lesson_data.exercises[state.exercise]
    if not exercise_data then
        -- If no more exercises in this lesson, try to move to the next lesson
        LEARN_VIM.navigation.next_lesson()
        return
    end

    -- Get the exercise buffer
    local exercise_bufnr = state.exercise_bufnr
    if exercise_bufnr == -1 or not vim.api.nvim_buf_is_valid(exercise_bufnr) then
         vim.notify("Error: Exercise buffer not valid.", vim.log.levels.ERROR)
         return
    end

    -- Clear the exercise buffer and set its content
    vim.api.nvim_buf_set_lines(exercise_bufnr, 0, -1, false, {})
    local lines = vim.split(exercise_data.setup_text, '\n')
    vim.api.nvim_buf_set_lines(exercise_bufnr, 0, 0, false, lines)

    -- Set the filetype for syntax highlighting (optional, but good practice)
    -- You might want to infer filetype from the exercise metadata if you add it
    -- For now, let's keep it simple or set a default
    -- vim.api.nvim_buf_set_option(exercise_bufnr, 'filetype', 'text') -- Or detect based on exercise

    -- Set cursor position if specified
    if exercise_data.start_cursor then
        -- Nvim cursor is 0-indexed for line, 0-indexed for column
        -- Lua table is 1-indexed for line, 1-indexed for column
        -- Adjusting from 1-indexed Lua to 0-indexed Nvim
        local line = exercise_data.start_cursor[1] - 1
        local col = exercise_data.start_cursor[2] - 1
        vim.api.nvim_win_set_cursor(state.exercise_winid, {line, col})
    else
         -- Default to top-left if not specified
         vim.api.nvim_win_set_cursor(state.exercise_winid, {0, 0})
    end

    -- Make the exercise buffer editable
    Utils.set_buffer_options(exercise_bufnr, {modifiable = true, readonly = false})

    -- Ensure the exercise window is focused
    vim.api.nvim_set_current_win(state.exercise_winid)

    vim.notify("Exercise " .. state.module .. "." .. state.lesson .. "." .. state.exercise .. " loaded.", vim.log.levels.INFO)
end

--- Checks if the current exercise is completed correctly.
function M.check_current_exercise()
    local state = LEARN_VIM.current_state
    local module_data = LEARN_VIM.curriculum['module' .. state.module]
    local lesson_data = module_data and module_data['lesson' .. state.lesson]
    local exercise_data = lesson_data and lesson_data.exercises and lesson_data.exercises[state.exercise]

    if not exercise_data or not exercise_data.validation then
        vim.notify("No validation defined for this exercise.", vim.log.levels.WARN)
        return
    end

    local validation = exercise_data.validation
    local is_correct = false

    -- Get the current state of the exercise buffer
    local exercise_bufnr = state.exercise_bufnr
    local current_buffer_content = vim.api.nvim_buf_get_lines(exercise_bufnr, 0, -1, false)
    current_buffer_content = table.concat(current_buffer_content, '\n') -- Join lines for content checks

    -- Perform validation based on type
    if validation.type == 'check_buffer_content' then
        local target_content = table.concat(vim.split(validation.target_content, '\n'), '\n')
        is_correct = (current_buffer_content == target_content)

    -- New validation type: check_buffer_content_regex
    elseif validation.type == 'check_buffer_content_regex' then
        local pattern = validation.target_content_pattern
        -- Use vim.regex to create a regex object and match against the buffer content
        local regex = vim.regex(pattern)
        is_correct = (regex:match_str(current_buffer_content) ~= nil) -- match_str returns nil if no match

    elseif validation.type == 'check_cursor_position' then
        local current_cursor = vim.api.nvim_win_get_cursor(state.exercise_winid)
         -- Adjusting from 0-indexed Nvim to 1-indexed Lua for comparison with target
        local current_line = current_cursor[1] + 1
        local current_col = current_cursor[2] + 1
        local target_cursor = validation.target_cursor
        is_correct = (current_line == target_cursor[1] and current_col == target_cursor[2])

    elseif validation.type == 'check_mode' then
        local current_mode = vim.api.nvim_get_mode().mode
        is_correct = (current_mode == validation.target_mode)

    elseif validation.type == 'check_command' then
        -- This is a simplified check that relies on the user typing the command.
        -- A more robust check would involve monitoring command history, which is complex.
        -- For now, we'll assume if they are on this exercise and press exc, they attempted the command.
        -- A better approach might be to capture command-line input directly.
        -- Given the limitations, let's just check mode and rely on instruction following.
         local current_mode = vim.api.nvim_get_mode().mode
         is_correct = (current_mode == 'n') -- Assume they returned to Normal mode after command
         vim.notify("Validation for command exercises is basic. Please ensure you typed: " .. validation.target_command, vim.log.levels.INFO)


    -- Add other validation types here
    -- elseif validation.type == 'another_type' then
    --     -- ... validation logic ...

    else
        vim.notify("Unknown validation type: " .. validation.type, vim.log.levels.ERROR)
        return
    end

    -- Provide feedback and move to the next exercise if correct
    if is_correct then
        vim.notify(exercise_data.feedback or "Exercise correct!", vim.log.levels.INFO)
        LEARN_VIM.navigation.next_exercise() -- Move to the next exercise
    else
        vim.notify("Exercise incorrect. Try again or use :LearnVim exr to reset.", vim.log.levels.WARN)
    end
end

--- Resets the current exercise to its initial state.
function M.reset_current_exercise()
    local state = LEARN_VIM.current_state
    local module_data = LEARN_VIM.curriculum['module' .. state.module]
    local lesson_data = module_data and module_data['lesson' .. state.lesson]
    local exercise_data = lesson_data and lesson_data.exercises and lesson_data.exercises[state.exercise]

    if not exercise_data then
        vim.notify("No exercise data to reset.", vim.log.levels.WARN)
        return
    end

    -- Get the exercise buffer
    local exercise_bufnr = state.exercise_bufnr
     if exercise_bufnr == -1 or not vim.api.nvim_buf_is_valid(exercise_bufnr) then
         vim.notify("Error: Exercise buffer not valid for reset.", vim.log.levels.ERROR)
         return
    end

    -- Clear the exercise buffer and set its content back to the setup_text
    vim.api.nvim_buf_set_option(exercise_bufnr, 'modifiable', true) -- Ensure it's modifiable before clearing
    vim.api.nvim_buf_set_lines(exercise_bufnr, 0, -1, false, {})
    local lines = vim.split(exercise_data.setup_text, '\n')
    vim.api.nvim_buf_set_lines(exercise_bufnr, 0, 0, false, lines)

     -- Reset cursor position if specified
    if exercise_data.start_cursor then
        local line = exercise_data.start_cursor[1] - 1
        local col = exercise_data.start_cursor[2] - 1
        vim.api.nvim_win_set_cursor(state.exercise_winid, {line, col})
    else
         -- Default to top-left if not specified
         vim.api.nvim_win_set_cursor(state.exercise_winid, {0, 0})
    end

    vim.notify("Exercise reset.", vim.log.levels.INFO)
end


-- Return the module table M
return M
