-- lua/learn_vim/modules/module3.lua

-- This file contains the content for Module 3: More Efficient Navigation (By Word & Line).
-- It returns a table representing this module's structure and lessons.

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
                setup_text = [[
" --- Exercise 3.1.1 ---
" Instruction: Using only the `w` key, move the cursor to the start of the word 'wizards'. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

Jinxed wizards pluck ivy from the big quilt.]], -- Changed phrase
                start_cursor = {5, 0}, -- Start on 'J'
                validation = { type = 'check_cursor_position', target_cursor = {5, 7} }, -- Target on 'w' of 'wizards'
                feedback = "Correct! 'w' moves to the start of the next word.",
            },
            {
                instruction = "Using only the `e` key, move the cursor to the end of the word 'ivy'. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.1.2 ---
" Instruction: Using only the `e` key, move the cursor to the end of the word 'ivy'. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

Jinxed wizards pluck ivy from the big quilt.]], -- Changed phrase
                start_cursor = {5, 15}, -- Start on 'p' of 'pluck'
                validation = { type = 'check_cursor_position', target_cursor = {5, 21} }, -- Target on 'y' of 'ivy'
                feedback = "Correct! 'e' moves to the end of the word.",
            },
             {
                instruction = "Using only the `b` key, move the cursor to the start of the word 'pluck'. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.1.3 ---
" Instruction: Using only the `b` key, move the cursor to the start of the word 'pluck'. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

Jinxed wizards pluck ivy from the big quilt.]], -- Changed phrase
                start_cursor = {5, 22}, -- Start on space after 'ivy'
                validation = { type = 'check_cursor_position', target_cursor = {5, 15} }, -- Target on 'p' of 'pluck'
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
                setup_text = [[
" --- Exercise 3.2.1 ---
" Instruction: From anywhere in the buffer, type `gg` to jump to the first line. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Line 1
Line 2
Line 3
Line 4
Line 5
Line 6
Line 7
Line 8
Line 9
Line 10
Line 11
Line 12
Line 13
Line 14
Line 15
Line 16
Line 17
Line 18
Line 19
Line 20]],
                start_cursor = {15, 5}, -- Start somewhere in the middle
                validation = { type = 'check_cursor_position', target_cursor = {1, 0} }, -- Target is the first line (line 1, col 0)
                feedback = "Great! You jumped to the top of the file.",
            },
            {
                instruction = "From anywhere in the buffer, type `G` to jump to the last line. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.2.2 ---
" Instruction: From anywhere in the buffer, type `G` to jump to the last line. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Line 1
Line 2
Line 3
Line 4
Line 5
Line 6
Line 7
Line 8
Line 9
Line 10
Line 11
Line 12
Line 13
Line 14
Line 15
Line 16
Line 17
Line 18
Line 19
Line 20]],
                start_cursor = {8, 10}, -- Start somewhere in the middle
                -- Target is the last line (line 20)
                validation = { type = 'check_cursor_position', target_cursor = {20, 0} },
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
                setup_text = [[
" --- Exercise 3.3.1 ---
" Instruction: Using `{number}G`, jump to line 10. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Line 1
Line 2
Line 3
Line 4
Line 5
Line 6
Line 7
Line 8
Line 9
Line 10
Line 11
Line 12
Line 13
Line 14
Line 15
Line 16
Line 17
Line 18
Line 19
Line 20]],
                start_cursor = {5, 0}, -- Start on line 5
                validation = { type = 'check_cursor_position', target_cursor = {10, 0} }, -- Target is line 10
                feedback = "You jumped to line 10!",
            },
             {
                instruction = "Move the cursor to the start of the line using `0`. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.3.2 ---
" Instruction: Move the cursor to the start of the line using `0`. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
    This line has leading spaces.]], -- Note the leading spaces
                start_cursor = {5, 10}, -- Start somewhere in the middle of the line
                validation = { type = 'check_cursor_position', target_cursor = {5, 0} }, -- Target is column 0
                feedback = "Correct! '0' goes to the very first character.",
            },
             {
                instruction = "Move the cursor to the first non-blank character using `^`. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.3.3 ---
" Instruction: Move the cursor to the first non-blank character using `^`. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
    This line has leading spaces.]], -- Note the leading spaces
                start_cursor = {5, 0}, -- Start at the very beginning (column 0)
                validation = { type = 'check_cursor_position', target_cursor = {5, 4} }, -- Target is the first non-blank character ('T' at column 4)
                feedback = "Correct! '^' skips leading whitespace.",
            },
            {
                instruction = "Move the cursor to the end of the line using `$`. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.3.4 ---
" Instruction: Move the cursor to the end of the line using `$`. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
This is a line.]],
                start_cursor = {5, 0}, -- Start at the beginning
                validation = { type = 'check_cursor_position', target_cursor = {5, 16} }, -- Target is the last character (the '.')
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
                setup_text = [[
" --- Exercise 3.4.1 ---
" Instruction: Using a numerical prefix with `j`, move down exactly 3 lines from the starting position. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Start here.
Line 1
Line 2
Line 3
Target line.
Line 5
Line 6
Line 7
Line 8
Line 9
Line 10]],
                start_cursor = {5, 0}, -- Start on "Start here."
                validation = { type = 'check_cursor_position', target_cursor = {8, 0} }, -- Target is "Target line." (3 lines down)
                feedback = "Excellent! You moved down multiple lines with a count.",
            },
            {
                instruction = "Using a numerical prefix with `k`, move up exactly 4 lines from the starting position. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.4.2 ---
" Instruction: Using a numerical prefix with `k`, move up exactly 4 lines from the starting position. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Line 1
Line 2
Line 3
Line 4
Target line.
Line 6
Line 7
Line 8
Line 9
Start here.
Line 11
Line 12]],
                start_cursor = {10, 0}, -- Start on "Start here."
                validation = { type = 'check_cursor_position', target_cursor = {6, 0} }, -- Target is "Target line." (4 lines up)
                feedback = "Well done! You moved up multiple lines with a count.",
            },
            {
                instruction = "Using a numerical prefix with `w`, move forward exactly 5 words from the starting position. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.4.3 ---
" Instruction: Using a numerical prefix with `w`, move forward exactly 5 words from the starting position. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

Start here: One two three four five six seven.]],
                start_cursor = {5, 12}, -- Start on 'O' of "One"
                validation = { type = 'check_cursor_position', target_cursor = {5, 34} }, -- Target is the start of "six" (5 words after "One")
                feedback = "Great! You jumped forward multiple words.",
            },
             {
                instruction = "Using a numerical prefix with `b`, move backward exactly 3 words from the starting position. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = [[
" --- Exercise 3.4.4 ---
" Instruction: Using a numerical prefix with `b`, move backward exactly 3 words from the starting position. Then type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

One two three four five six seven: Start here.]],
                start_cursor = {5, 38}, -- Start on 'S' of "Start"
                validation = { type = 'check_cursor_position', target_cursor = {5, 23} }, -- Target is the start of "four" (3 words before "Start")
                feedback = "Excellent! You jumped backward multiple words.",
            },
        },
    },
    -- Add more lessons for Module 3 here
    -- lesson5 = { ... }
}

