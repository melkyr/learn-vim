-- lua/learn_vim/navigation.lua

-- This module handles navigating between lessons and modules.
-- It is structured as a function that is called with the parent module (M) from init.lua.

return function(M) -- Accept the parent module M as an argument
    local M_nav = {} -- Local module table for navigation functions

    --- Start Tutorial ---
    -- Loads progress, closes other windows, sets up the UI, and displays the current lesson.
    function M_nav.start()
        M.load_progress() -- Call state loading function via M

        -- FIX: Close all other windows before setting up the tutorial UI.
        -- This ensures the tutorial is the only thing visible.
        -- Use :only command which closes all windows except the current one.
        -- We use pcall in case there's only one window open already.
        pcall(vim.cmd, 'only')


        M.setup_tutorial_ui() -- Call UI setup function via M (this takes over the current window)
        M.display_lesson(M.current_state.module, M.current_state.lesson) -- Call UI display function via M
        vim.notify("Learning Vim: Starting at Module " .. M.current_state.module .. ", Lesson " .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
        vim.api.nvim_command('redraw') -- Force redraw to ensure UI updates are visible immediately
    end

    --- Go to Next Lesson/Exercise ---
    -- Moves the user to the next exercise within the current lesson, or to the next lesson/module.
    -- This function is primarily called automatically after an exercise is completed (from exercise.lua).
    -- It can also be called manually via :LearnVim next (though the exercise completion logic is preferred).
    function M_nav.next_lesson() -- Renamed from next_lesson to be more general 'next' step
        local current_module_data = M.curriculum['module' .. M.current_state.module] -- Access curriculum via M
        if current_module_data then
            -- Check if there's a next exercise in the current lesson
            local current_lesson_data = current_module_data['lesson' .. M.current_state.lesson]
            if current_lesson_data and current_lesson_data.exercises and M.current_state.exercise < #current_lesson_data.exercises then
                 -- Move to the next exercise within the same lesson
                 M.current_state.exercise = M.current_state.exercise + 1
                 M.save_progress() -- Save progress after moving exercise
                 M.display_lesson(M.current_state.module, M.current_state.lesson) -- Display the updated lesson/exercise
                 vim.notify("Moving to next exercise in lesson " .. M.current_state.module .. "." .. M.current_state.lesson .. ".", vim.log.levels.INFO)
            else
                -- No more exercises in this lesson, try moving to the next lesson
                local next_lesson_id = M.current_state.lesson + 1
                if current_module_data['lesson' .. next_lesson_id] then
                    -- Move to the next lesson
                    M.current_state.lesson = next_lesson_id
                    M.current_state.exercise = 1 -- Reset exercise counter for the new lesson
                    M.save_progress() -- Save progress after moving lesson
                    M.display_lesson(M.current_state.module, M.current_state.lesson)
                    vim.notify("Moving to next lesson: " .. M.current_state.module .. "." .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
                else
                    -- No more lessons in this module, try moving to the next module
                    local next_module_id = M.current_state.module + 1
                    if M.curriculum['module' .. next_module_id] then -- Access curriculum via M
                        -- Move to the next module
                        M.current_state.module = next_module_id
                        M.current_state.lesson = 1
                        M.current_state.exercise = 1
                        M.save_progress()
                        M.display_lesson(M.current_state.module, M.current_state.lesson)
                         vim.notify("Moving to next module: " .. M.current_state.module .. "." .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
                    else
                        -- Reached the end of the defined curriculum
                        vim.notify("You have completed the tutorial (or reached the end of defined content)!", vim.log.levels.INFO)
                        -- TODO: Handle completion - maybe close tutorial windows or show a completion message?
                    end
                end
            end
        else
            -- Should not happen if state is valid, but handle defensively
            vim.notify("Error: Current module data not found.", vim.log.levels.ERROR)
        end
         vim.api.nvim_command('redraw')
    end


    --- Go to Previous Lesson ---
    -- Moves the user to the previous lesson or the last lesson of the previous module.
    function M_nav.prev_lesson()
         -- Check if we can move to the previous lesson within the current module
         if M.current_state.lesson > 1 then
             M.current_state.lesson = M.current_state.lesson - 1
             M.current_state.exercise = 1 -- Reset exercise counter for the new lesson
             M.save_progress() -- Save progress
             M.display_lesson(M.current_state.module, M.current_state.lesson) -- Display the previous lesson
             vim.notify("Moving to previous lesson: " .. M.current_state.module .. "." .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
         else
             -- At the start of a module, try moving to the previous module
             if M.current_state.module > 1 then
                 local prev_module_id = M.current_state.module - 1
                 local prev_module_data = M.curriculum['module' .. prev_module_id] -- Access curriculum via M
                 if prev_module_data then
                     -- Go to the last lesson of the previous module
                     local last_lesson_id = 1
                     -- Find the last lesson number dynamically by iterating
                     for i = 1, 1000 do -- Arbitrary limit, adjust if needed or find a better way
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
                     M.display_lesson(M.current_state.module, M.current_state.lesson)
                     vim.notify("Moving to previous module: " .. M.current_state.module .. "." .. M.current_state.lesson .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
                 else
                      vim.notify("Error: Previous module data not found.", vim.log.levels.ERROR)
                 end
             else
                 -- Already at the very beginning of the tutorial
                 vim.notify("You are already at the beginning of the tutorial.", vim.log.levels.INFO)
             end
         end
          vim.api.nvim_command('redraw')
    end

    --- Go to Specific Lesson ---
    -- Jumps the user directly to a specified lesson.
    function M_nav.goto_lesson(module_id, lesson_id)
         -- Validate that the requested lesson exists in the curriculum.
         local module_data = M.curriculum['module' .. module_id] -- Access curriculum via M
         if module_data and module_data['lesson' .. lesson_id] then
             -- Update the current state
             M.current_state.module = module_id
             M.current_state.lesson = lesson_id
             M.current_state.exercise = 1 -- Reset exercise counter when jumping lessons
             M.save_progress() -- Save the new position
             M.display_lesson(module_id, lesson_id) -- Display the requested lesson
             vim.notify("Jumping to lesson: " .. module_id .. "." .. lesson_id .. ". Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
         else
             vim.notify("Lesson " .. module_id .. "." .. lesson_id .. " not found.", vim.log.levels.WARN)
         end
          vim.api.nvim_command('redraw')
    end

    --- Restart Tutorial ---
    -- Resets the tutorial progress to the beginning and restarts the display.
    function M_nav.restart_tutorial()
         -- Reset the state to the initial values.
         M.current_state = { module = 1, lesson = 1, exercise = 1 }
         -- Reset UI state as well, so setup_tutorial_ui recreates windows/buffers cleanly.
         M.current_state.tutorial_bufnr = -1
         M.current_state.exercise_bufnr = -1
         M.current_state.tutorial_winid = -1
         M.current_state.exercise_winid = -1

         M.save_progress() -- Save the reset state

         -- FIX: Close all other windows before setting up the UI on restart as well
         pcall(vim.cmd, 'only')

         M.setup_tutorial_ui() -- Recreate UI
         M.display_lesson(M.current_state.module, M.current_state.lesson) -- Display the first lesson
         vim.notify("Tutorial restarted. Use 'exc' to check, 'exr' to reset.", vim.log.levels.INFO)
         vim.api.nvim_command('redraw')
    end

    -- Return the local module table containing the public functions.
    return M_nav
end
