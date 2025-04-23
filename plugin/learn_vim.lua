-- plugin/learn_vim.lua

-- This file is sourced automatically by Neovim at startup
-- because it's in the 'plugin/' directory of a 'start/' plugin package.
-- Its primary job is to define user commands and mappings
-- that call into the main plugin logic written in Lua modules.

-- Require the main Lua module for the plugin.
-- This implicitly loads lua/learn_vim/init.lua and any modules it requires.
local learn_vim = require('learn_vim')

-- Define the main user command :LearnVim
-- This command acts as the main interface for the tutorial.
vim.api.nvim_create_user_command('LearnVim', function(opts)
    -- 'opts.args' contains the arguments passed to the command (e.g., "start", "next", "lesson 1.2")

    local args_string = opts.args -- Get the full argument string

    -- Check for common commands first
    if args_string == '' or args_string == 'start' then
        learn_vim.start() -- Call the start function from the main module
    elseif args_string == 'next' then
        learn_vim.next_lesson() -- Call the next_lesson function
    elseif args_string == 'prev' then
        learn_vim.prev_lesson() -- Call the prev_lesson function
    elseif args_string == 'restart' then
        learn_vim.restart_tutorial() -- Call the restart function
    else
        -- Handle potential commands with arguments, like 'lesson <m.l>'
        local args = vim.split(args_string, ' ') -- Split arguments by space

        if #args >= 2 and args[1] == 'lesson' then
            -- Expecting format "lesson <module>.<lesson>"
            local lesson_coords_str = table.concat(vim.list_slice(args, 2), ' ') -- Join the rest of args in case of spaces
            local lesson_coords = vim.split(lesson_coords_str, '.', { plain = true })

            if #lesson_coords == 2 then
                local module_id = tonumber(lesson_coords[1])
                local lesson_id = tonumber(lesson_coords[2])

                if module_id and lesson_id and module_id >= 1 and lesson_id >= 1 then
                    learn_vim.goto_lesson(module_id, lesson_id) -- Call the goto_lesson function
                else
                    vim.notify("Invalid lesson number format. Use positive integers (e.g., :LearnVim lesson 1.2)", vim.log.levels.WARN)
                end
            else
                 vim.notify("Invalid lesson format. Use :LearnVim lesson <module>.<lesson> (e.g., :LearnVim lesson 1.2)", vim.log.levels.WARN)
            end
        else
            -- If no recognized command/argument combo, show help
            vim.notify("Unknown command: :LearnVim " .. args_string, vim.log.levels.WARN)
            vim.notify("Usage: :LearnVim [start | next | prev | restart | lesson <module>.<lesson>]", vim.log.levels.INFO)
        end
    end
end, {
    nargs = '*', -- Allows any number of arguments after :LearnVim
    desc = 'Start or control the interactive Vim learning tutorial',
})

-- Define <Plug> mappings for checking and resetting exercises.
-- Users will map keys like 'exc' and 'exr' to these <Plug> mappings in their config.
vim.api.nvim_set_keymap('n', '<Plug>(LearnVim_CheckExercise)', ':lua require("learn_vim").check_current_exercise()<CR>', { silent = true, desc = 'LearnVim: Check current exercise completion' })
vim.api.nvim_set_keymap('n', '<Plug>(LearnVim_ResetExercise)', ':lua require("learn_vim").reset_current_exercise()<CR>', { silent = true, desc = 'LearnVim: Reset current exercise' })

-- Note: This file should *only* define commands and mappings that call into
-- your Lua modules under lua/learn_vim/. Avoid putting any core logic here.
