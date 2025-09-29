-- lua/learn_vim/modules/module3.lua

-- This file contains the content for Module 3: More Efficient Navigation (By Word & Line).
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')

return {
    title = "More Efficient Navigation (By Word & Line)", -- Updated title
    lesson1 = {
        title = "Moving by Word (`w`, `b`, `e`)",
        explanation = [[
Welcome to Module 3, Lesson 3.1!

Moving character by character with `h`, `j`, `k`, and `l` is fundamental, but Vim offers much faster ways to navigate. Moving by **words** is one of the most common.

In Normal mode:
* `w` - Move cursor to the **start** of the **next** word.
* `b` - Move cursor to the **start** of the **previous** word.
* `e` - Move cursor to the **end** of the **current** or next word.

Try using these commands to move the cursor around the text in the exercise pane. Remember that punctuation is often treated as a separate word in Vim.

Use `:LearnVim exc` to check when you think you've completed the task!
]],
        exercises = {
            {
                instruction = "Using only the `w` key, move the cursor to the start of the word 'wizards'. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson1_exercise1_setup.txt"),
                start_cursor = {6, 1}, -- Start on 'J'
                validation = { type = 'check_cursor_position', target_cursor = {6, 8} }, -- Target on 'w' of 'wizards'
                feedback = "Correct! 'w' moves to the start of the next word.",
            },
            {
                instruction = "Using only the `e` key, move the cursor to the end of the word 'ivy'. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson1_exercise2_setup.txt"),
                start_cursor = {6, 16}, -- Start on 'p' of 'pluck'
                validation = { type = 'check_cursor_position', target_cursor = {6, 24} }, -- Target on 'y' of 'ivy'
                feedback = "Correct! 'e' moves to the end of the word.",
            },
             {
                instruction = "Using only the `b` key, move the cursor to the start of the word 'pluck'. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson1_exercise3_setup.txt"),
                start_cursor = {6, 25}, -- Start on space after 'ivy'
                validation = { type = 'check_cursor_position', target_cursor = {6, 16} }, -- Target on 'p' of 'pluck'
                feedback = "Correct! 'b' moves to the start of the previous word.",
            },
        },
    },
    lesson2 = {
        title = "Jumping to Start/End of File (`gg`, `G`)",
        explanation = [[
Welcome to Lesson 3.2!

Moving word by word is faster than character by character, but sometimes you need to jump much further – like to the very beginning or end of a file.

In Normal mode:
* **`gg`**: Jump to the **first** line of the file.
* **`G`**: Jump to the **last** line of the file.

These are extremely useful for quickly navigating large files.

Let's practice jumping around this exercise buffer. Use `:LearnVim exc` to check after each jump.
]],
        exercises = {
            {
                instruction = "From anywhere in the buffer, type `gg` to jump to the first line. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson2_exercise1_setup.txt"),
                start_cursor = {15, 5}, -- Start somewhere in the middle
                validation = { type = 'check_cursor_position', target_cursor = {1, 1} }, -- Target is the first line (line 1, col 1)
                feedback = "Great! You jumped to the top of the file.",
            },
            {
                instruction = "From anywhere in the buffer, type `G` to jump to the last line. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson2_exercise2_setup.txt"),
                start_cursor = {8, 10}, -- Start somewhere in the middle
                -- Target is the last line (line 20)
                validation = { type = 'check_cursor_position', target_cursor = {25, 1} },
                feedback = "Excellent! You jumped to the bottom of the file.",
            },
        },
    },
    lesson3 = {
        title = "Line Navigation (`{number}G`, `0`, `^`, `$`)",
        explanation = [[
Welcome to Lesson 3.3!

Beyond the very start and end, you can jump to specific lines and move efficiently within a single line.

In Normal mode:
* **`{number}G`**: Jump to the line number specified by `{number}`. For example, `5G` jumps to line 5.
* **`0`** (zero): Move cursor to the **first character** of the current line (including leading whitespace).
* **`^`**: Move cursor to the **first non-blank character** of the current line.
* **`$`**: Move cursor to the **end** of the current line.

Let's practice these precise line movements. Use `:LearnVim exc` after each step.
]],
        exercises = {
            {
                instruction = "Using `{number}G`, jump to line 10. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson3_exercise1_setup.txt"),
                start_cursor = {5, 1}, -- Start on line 5
                validation = { type = 'check_cursor_position', target_cursor = {10, 1} }, -- Target is line 10
                feedback = "You jumped to line 10!",
            },
             {
                instruction = "Move the cursor to the start of the line using `0`. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson3_exercise2_setup.txt"),
                start_cursor = {5, 10}, -- Start somewhere in the middle of the line
                validation = { type = 'check_cursor_position', target_cursor = {5, 1} }, -- Target is column 1
                feedback = "Correct! '0' goes to the very first character.",
            },
             {
                instruction = "Move the cursor to the first non-blank character using `^`. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson3_exercise3_setup.txt"),
                start_cursor = {5, 1}, -- Start at the very beginning (column 0)
                validation = { type = 'check_cursor_position', target_cursor = {5, 5} }, -- Target is the first non-blank character ('T' at column 4)
                feedback = "Correct! '^' skips leading whitespace.",
            },
            {
                instruction = "Move the cursor to the end of the line using `$`. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson3_exercise4_setup.txt"),
                start_cursor = {5, 1}, -- Start at the beginning
                validation = { type = 'check_cursor_position', target_cursor = {5, 15} }, -- Target is the last character (the '.')
                feedback = "Correct! '$' goes to the end of the line.",
            },
        },
    },
    lesson4 = { -- New lesson for numerical prefixes
        title = "Combining Counts with Movements",
        explanation = [[
Welcome to Lesson 3.4!

Vim commands can often be prefixed with a **number** to repeat the action that many times. This is incredibly powerful for faster navigation and editing.

For example:
* `3j` - Move down 3 lines.
* `5k` - Move up 5 lines.
* `10w` - Move forward 10 words.
* `2b` - Move backward 2 words.

This works with many movement commands!

Let's practice using counts with vertical and horizontal movements. Use `:LearnVim exc` after each step.
]],
        exercises = {
            {
                instruction = "Using a numerical prefix with `j`, move down exactly 3 lines from the starting position. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson4_exercise1_setup.txt"),
                start_cursor = {5, 1}, -- Start on "Start here."
                validation = { type = 'check_cursor_position', target_cursor = {8, 1} }, -- Target is "Target line." (3 lines down)
                feedback = "Excellent! You moved down multiple lines with a count.",
            },
            {
                instruction = "Using a numerical prefix with `k`, move up exactly 4 lines from the starting position. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson4_exercise2_setup.txt"),
                start_cursor = {10, 1}, -- Start on "Start here."
                validation = { type = 'check_cursor_position', target_cursor = {6, 1} }, -- Target is "Target line." (4 lines up)
                feedback = "Well done! You moved up multiple lines with a count.",
            },
            {
                instruction = "Using a numerical prefix with `w`, move forward exactly 5 words from the starting position. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson4_exercise3_setup.txt"),
                start_cursor = {5, 12}, -- Start on 'O' of "One"
                validation = { type = 'check_cursor_position', target_cursor = {5, 36} }, -- Target is the start of "six"
                feedback = "Great! You jumped forward multiple words.",
            },
             {
                instruction = "Using a numerical prefix with `b`, move backward exactly 3 words from the starting position. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module3_lesson4_exercise4_setup.txt"),
                start_cursor = {5, 35}, -- Start on 'S' of "Start"
                validation = { type = 'check_cursor_position', target_cursor = {5, 19} }, -- Target is the start of "five" (3 words before "Start")
                feedback = "Excellent! You jumped backward multiple words.",
            },
        },
    },
    -- Add more lessons for Module 3 here
    -- lesson5 = { ... }
}

