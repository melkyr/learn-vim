-- lua/learn_vim/navigation.lua

-- This module handles navigating between lessons and modules.
-- It is structured as a function that is called with the parent module (M) from init.lua.

return function(M) -- Accept the parent module M as an argument
    local M_nav = {} -- Local module table for navigation functions

    --- Start Tutorial ---
    -- Loads progress, closes other windows, sets up the UI, and displays the current lesson.
    function M_nav.start()
        M.load_progress() -- Call state loading function via M

        -- Close all other windows before setting up the tutorial UI.
        pcall(vim.cmd, 'only')

        M.ui.setup_tutorial_ui() -- Call UI setup function via M
        M.ui.display_lesson(M.current_state.module, M.current_state.lesson) -- Call UI display function via M.ui
        vim.notify("Learning Vim: Starting at Module " .. M.current_state.module .. ", Lesson " .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
        vim.api.nvim_command('redraw') -- Force redraw
    end

    --- Go to Next Lesson/Exercise ---
    function M_nav.next_lesson()
        local current_module_data = M.curriculum['module' .. M.current_state.module]
        if current_module_data then
            local current_lesson_data = current_module_data['lesson' .. M.current_state.lesson]
            if current_lesson_data and current_lesson_data.exercises and M.current_state.exercise < #current_lesson_data.exercises then
                M.current_state.exercise = M.current_state.exercise + 1
                M.save_progress()
                M.ui.display_lesson(M.current_state.module, M.current_state.lesson)
                vim.notify("Moving to next exercise in lesson " .. M.current_state.module .. "." .. M.current_state.lesson .. ".", vim.log.levels.INFO)
            else
                local next_lesson_id = M.current_state.lesson + 1
                if current_module_data['lesson' .. next_lesson_id] then
                    M.current_state.lesson = next_lesson_id
                    M.current_state.exercise = 1
                    M.save_progress()
                    M.ui.display_lesson(M.current_state.module, M.current_state.lesson)
                    vim.notify("Moving to next lesson: " .. M.current_state.module .. "." .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
                else
                    local next_module_id = M.current_state.module + 1
                    if M.curriculum['module' .. next_module_id] then
                        M.current_state.module = next_module_id
                        M.current_state.lesson = 1
                        M.current_state.exercise = 1
                        M.save_progress()
                        M.ui.display_lesson(M.current_state.module, M.current_state.lesson)
                        vim.notify("Moving to next module: " .. M.current_state.module .. "." .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
                    else
                        vim.notify("You have completed the tutorial (or reached the end of defined content)!", vim.log.levels.INFO)
                    end
                end
            end
        else
            vim.notify("Error: Current module data not found.", vim.log.levels.ERROR)
        end
        vim.api.nvim_command('redraw')
    end

    --- Go to Previous Lesson ---
    function M_nav.prev_lesson()
        if M.current_state.lesson > 1 then
            M.current_state.lesson = M.current_state.lesson - 1
            M.current_state.exercise = 1
            M.save_progress()
            M.ui.display_lesson(M.current_state.module, M.current_state.lesson)
            vim.notify("Moving to previous lesson: " .. M.current_state.module .. "." .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
        else
            if M.current_state.module > 1 then
                local prev_module_id = M.current_state.module - 1
                local prev_module_data = M.curriculum['module' .. prev_module_id]
                if prev_module_data then
                    local last_lesson_id = 1
                    for i = 1, 1000 do
                        if prev_module_data['lesson' .. (i + 1)] then
                            last_lesson_id = i + 1
                        else
                            break
                        end
                    end
                    M.current_state.module = prev_module_id
                    M.current_state.lesson = last_lesson_id
                    M.current_state.exercise = 1
                    M.save_progress()
                    M.ui.display_lesson(M.current_state.module, M.current_state.lesson)
                    vim.notify("Moving to previous module: " .. M.current_state.module .. "." .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
                else
                    vim.notify("Error: Previous module data not found.", vim.log.levels.ERROR)
                end
            else
                vim.notify("You are already at the beginning of the tutorial.", vim.log.levels.INFO)
            end
        end
        vim.api.nvim_command('redraw')
    end

    --- Go to Specific Lesson ---
    function M_nav.goto_lesson(module_id, lesson_id)
        local module_data = M.curriculum['module' .. module_id]
        if module_data and module_data['lesson' .. lesson_id] then
            M.current_state.module = module_id
            M.current_state.lesson = lesson_id
            M.current_state.exercise = 1
            M.save_progress()
            M.ui.display_lesson(module_id, lesson_id)
            vim.notify("Jumping to lesson: " .. module_id .. "." .. lesson_id .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
        else
            vim.notify("Lesson " .. module_id .. "." .. lesson_id .. " not found.", vim.log.levels.WARN)
        end
        vim.api.nvim_command('redraw')
    end

    --- Restart Tutorial ---
    function M_nav.restart_tutorial()
        M.current_state = { module = 1, lesson = 1, exercise = 1, tutorial_bufnr = -1, exercise_bufnr = -1, tutorial_winid = -1, exercise_winid = -1 }
        M.save_progress()
        pcall(vim.cmd, 'only')
        M.ui.setup_tutorial_ui()
        M.ui.display_lesson(M.current_state.module, M.current_state.lesson)
        vim.notify("Tutorial restarted. Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
        vim.api.nvim_command('redraw')
    end

    -- Return the local module table containing the public functions.
    return M_nav
end
