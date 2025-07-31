-- lua/learn_vim/modules/module0.lua

-- This file contains the content for Module 0: Essential First Steps.
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')
local locale = require('learn_vim.locale')

return {
    title = locale.get("module0_title"),

    lesson1 = {
        title = locale.get("module0_lesson1_title"),
        explanation = locale.get("module0_lesson1_explanation"),
        exercises = {
            {
                instruction = locale.get("module0_lesson1_exercise1_instruction"),
                type = "command",
                target_command = ":q!",
                -- No setup_text needed for a simple command check
                validation = { type = 'check_command', target_command = ':q!' },
                feedback = locale.get("module0_lesson1_exercise1_feedback"),
            },
            {
                instruction = locale.get("module0_lesson1_exercise2_instruction"),
                type = "command",
                target_command = ":wq",
                validation = { type = 'check_command', target_command = ':wq' },
                feedback = locale.get("module0_lesson1_exercise2_feedback"),
            },
        },
    }, -- Note the comma here

    lesson2 = {
        title = locale.get("module0_lesson2_title"),
        explanation = locale.get("module0_lesson2_explanation"),
        exercises = {
            {
                instruction = locale.get("module0_lesson2_exercise1_instruction"),
                type = "text_manipulation", -- Or a more generic type if appropriate
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson2_exercise1_setup.txt"),
                start_cursor = {1, 1}, -- Start at the beginning of the file (line 1, column 1)
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson2_exercise1_target.txt")
                },
                feedback = locale.get("module0_lesson2_exercise1_feedback"),
            },
        },
    }, -- Note the comma here

    lesson3 = {
        title = locale.get("module0_lesson3_title"),
        explanation = locale.get("module0_lesson3_explanation"),
        exercises = {
            {
                instruction = locale.get("module0_lesson3_exercise1_instruction"),
                type = "text_manipulation",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson3_exercise1_setup.txt"),
                start_cursor = {2, 1}, -- Start at "This line has..." (line 2, col 1)
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson3_exercise1_target.txt") -- To be created
                },
                feedback = locale.get("module0_lesson3_exercise1_feedback"),
            },
            {
                instruction = locale.get("module0_lesson3_exercise2_instruction"),
                type = "text_manipulation",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson3_exercise1_setup.txt"),
                start_cursor = {7, 1}, -- Start at "Another line for..." (line 7, col 1, assuming file content is as planned)
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson3_exercise2_target.txt") -- To be created
                },
                feedback = locale.get("module0_lesson3_exercise2_feedback"),
            },
        },
    }, -- Comma after lesson3

    lesson4 = {
        title = locale.get("module0_lesson4_title"),
        explanation = locale.get("module0_lesson4_explanation"),
        exercises = {
            {
                instruction = locale.get("module0_lesson4_exercise1_instruction"),
                type = "text_manipulation",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson4_exercise1_setup.txt"),
                start_cursor = {35, 1}, -- Start at "This is line 35." (middle of the file)
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson4_exercise1_target.txt") -- To be created
                },
                feedback = locale.get("module0_lesson4_exercise1_feedback"),
            },
            {
                instruction = locale.get("module0_lesson4_exercise2_instruction"),
                type = "text_manipulation",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson4_exercise1_setup.txt"),
                start_cursor = {35, 1}, -- Start at "This is line 35."
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson4_exercise2_target.txt") -- To be created
                },
                feedback = locale.get("module0_lesson4_exercise2_feedback"),
            },
            {
                instruction = locale.get("module0_lesson4_exercise3_instruction"),
                type = "text_manipulation",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson4_exercise1_setup.txt"),
                start_cursor = {1, 1}, -- Start at the top of the file
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module0_lesson4_exercise3_target.txt") -- To be created
                },
                feedback = locale.get("module0_lesson4_exercise3_feedback"),
            },
        },
    } -- No comma after the last lesson in the module
}
