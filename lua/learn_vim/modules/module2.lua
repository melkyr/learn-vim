-- lua/learn_vim/modules/module2.lua

-- This file contains the content for Module 2: Basic Navigation (The Home Row).
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')

return {
    title = "Basic Navigation (The Home Row)",
    lesson1 = {
        title = "Moving Left and Right (`h`, `l`)",
        explanation = [[
Welcome to Module 2, Lesson 2.1!

Now that you know how to enter Normal mode and save/quit, let's learn to move around efficiently.

In Normal mode, the most basic movement keys are right under your fingers on the home row:
* `h` - Move one character **left**
* `l` - Move one character **right**

Try moving the cursor left and right in the exercise pane. Remember to type `:LearnVim exc` to check when you think you've completed the task!
]],
        exercises = {
            {
                instruction = "Using only the `l` key, move the cursor to the character 'D'. Type `:LearnVim exc` to check.", -- Updated instruction
                type = "cursor_move", -- Indicates exercise is about cursor position
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module2_lesson1_exercise1_setup.txt"),
                start_cursor = {6, 0}, -- Cursor starts on 'A' (line 6, column 0)
                validation = { type = 'check_cursor_position', target_cursor = {6, 4} }, -- Target cursor is on 'D' (line 6, column 4)
                feedback = "Correct! You moved right.",
            },
             {
                instruction = "Using only the `h` key, move the cursor to the character 'E'. Type `:LearnVim exc` to check.", -- Updated instruction
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module2_lesson1_exercise2_setup.txt"),
                start_cursor = {5, 6}, -- Cursor starts on 'G' (line 5, column 6)
                validation = { type = 'check_cursor_position', target_cursor = {6, 4} }, -- Target cursor is on 'E' (line 5, column 4)
                feedback = "Correct! You moved left.",
             }
        },
    },
    lesson2 = {
        title = "Moving Down and Up (`j`, `k`)",
        explanation = [[
Welcome to Lesson 2.2!

Continuing with the home row, `j` and `k` move the cursor vertically:
* `j` - Move one line **down**
* `k` - Move one line **up**

These are incredibly common movements. Practice moving up and down in the exercise pane. Remember to type `:LearnVim exc` to check.
]],
        exercises = {
            {
                instruction = "Using only the `j` key, move the cursor down to 'Line 3'. Type `:LearnVim exc` to check.", -- Updated instruction
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module2_lesson2_exercise1_setup.txt"),
                start_cursor = {5, 0},
                validation = { type = 'check_cursor_position', target_cursor = {8, 1} },
                feedback = "Success! You moved down.",
            },
            {
                instruction = "Using only the `k` key, move the cursor up to 'Line 1'. Type `:LearnVim exc` to check.", -- Updated instruction
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module2_lesson2_exercise2_setup.txt"),
                start_cursor = {7, 0},
                validation = { type = 'check_cursor_position', target_cursor = {6, 1} },
                feedback = "Success! You moved up.",
            },
        },
    },
    lesson3 = {
        title = "Combining Basic Movements",
        explanation = [[
Welcome to Lesson 2.3!

You can combine `h`, `j`, `k`, and `l` to move anywhere character by character, line by line.

For example, from the start of a line, pressing `lj` moves right one character, then down one line.

Let's try navigating to a specific spot. Remember to type `:LearnVim exc` to check.
]],
        exercises = {
            {
                instruction = "Navigate to the character 'X' in this text using only `h`, `j`, `k`, and `l`. Type `:LearnVim exc` to check.", -- Updated instruction
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module2_lesson3_exercise1_setup.txt"),
                start_cursor = {5, 0},
                validation = { type = 'check_cursor_position', target_cursor = {6, 12} },
                feedback = "Great job navigating character by character!",
            },
        },
    },
}
