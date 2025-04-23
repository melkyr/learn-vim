-- lua/learn_vim/curriculum.lua

-- This module contains all the content for the interactive tutorial:
-- explanations, exercise setup text, instructions, and validation rules.

local curriculum = {
    -- --- Module 1: The Vim Mindset & Survival Basics ---
    module1 = {
        title = "The Vim Mindset & Survival Basics",
        lesson1 = {
            title = "Modal Editing Explained",
            explanation = [[
Welcome to the interactive Learn Vim tutorial!

You've chosen to learn one of the most powerful and efficient text editors available. Vim (and its modern successor, Neovim) has a steep initial learning curve, but mastering it can dramatically speed up your text editing workflow. The key difference from most editors is its "modal" nature.

Instead of having modifier keys for everything (like Ctrl+C, Ctrl+V), Vim switches between different modes, each optimized for a specific task.

The two most important modes are:
1.  **Normal Mode:** This is where you spend most of your time. Keys are commands for navigating, deleting, copying, pasting, and manipulating text. Pressing 'x' deletes a character, 'w' moves by a word, etc.
2.  **Insert Mode:** This is the mode you're probably familiar with from other editors. Keys type text directly into the buffer.

There are other modes like Visual mode (for selecting text) and Command-line mode (for saving, quitting, searching, and more powerful commands). We'll cover these soon.

Most operations in Vim follow a "verb + noun" structure (like 'delete word' or 'change inside parentheses'). This makes commands highly composable.

Learning Vim is about building muscle memory for switching modes and using Normal mode commands. It feels awkward at first, but stick with it!

To navigate this tutorial, you'll use Neovim's command line.
Type `:` and then one of these commands, followed by <Enter>:
`:LearnVim next` - Go to the next lesson.
`:LearnVim prev` - Go to the previous lesson.
`:LearnVim lesson 1.2` - Jump to a specific lesson (e.g., Module 1, Lesson 2).
`:LearnVim restart` - Start the tutorial from the beginning.

Ready? Type `:LearnVim next` and press <Enter> to move to the next lesson on entering Normal mode!
]],
            exercises = {}, -- No exercises for pure explanation lessons
        },
        lesson2 = {
            title = "Entering Normal Mode (`<Esc>`)",
            explanation = [[
Welcome to Lesson 1.2!

The most important skill in Vim is returning to **Normal Mode**. When you're in Insert Mode (typing text), you need to go back to Normal Mode to use commands.

The primary key for this is **`<Esc>`**.
(On some keyboards or setups, `<C-[>` - Control plus the left bracket - also works and is often easier to reach).

We've also set up two commands you can use in the exercise pane (the right window):
* In Normal mode, type **`exc`** to **check** if you've completed the current exercise.
* In Normal mode, type **`exr`** to **reset** the current exercise back to its starting state.

You will need to map `exc` and `exr` in your Neovim config (e.g., init.lua or vimrc) like this:
`nmap exc <Plug>(LearnVim_CheckExercise)`
`nmap exr <Plug>(LearnVim_ResetExercise)`

Let's practice!
]],
            exercises = {
                {
                    instruction = "You are currently in Insert mode. Press the `<Esc>` key to return to Normal mode. Then type 'exc' to check.",
                    type = "mode_switch", -- Indicates this exercise is about changing modes
                    -- No setup_text needed, the plugin will programmatically put the buffer into Insert mode
                    validation = { type = 'check_mode', target_mode = 'n' }, -- Validation rule: check if the final mode is Normal ('n')
                    feedback = "Success! You are now in Normal mode.", -- Message shown on successful completion
                },
                 {
                    instruction = "Press `i` to enter Insert mode. Type some text, then press `<Esc>` again to return to Normal mode. After returning to Normal mode, type 'exc' to check.",
                    type = "mode_switch", -- Still checking the final mode
                    setup_text = [[
" --- Exercise 1.2.2 ---
" Instruction: Press `i` to enter Insert mode. Type some text, then press `<Esc>` again to return to Normal mode. After returning to Normal mode, type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

Type something here:]], -- Initial text in the exercise buffer
                    start_cursor = {5, 16}, -- Optional: position cursor after "Type something here:" (line 5, col 16)
                    validation = { type = 'check_mode', target_mode = 'n' }, -- Validation rule: check final mode is Normal
                    feedback = "Good! Switching modes is essential.",
                 }
            },
        },
        lesson3 = {
            title = "Entering Insert Mode (`i`)",
             explanation = [[
Welcome to Lesson 1.3!

Now that you know how to get *out* of Insert mode, let's get *into* it.

The most common way to enter Insert mode is by pressing the `i` key while in Normal mode. This puts you into Insert mode *before* the character under the cursor.

Let's practice typing something *before* existing text. Remember to press `<Esc>` to return to Normal mode and then `exc` to check.
]],
            exercises = {
                {
                    instruction = "Press `i` to enter Insert mode. Type 'INSERTED ' before 'TARGET', then press `<Esc>`. Type 'exc' to check.",
                    type = "insert_text", -- Indicates this exercise is about inserting text
                    setup_text = [[
" --- Exercise 1.3.1 ---
" Instruction: Press `i` to enter Insert mode. Type 'INSERTED ' before 'TARGET', then press `<Esc>`. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

Insert text before TARGET here.]], -- Initial text including header comments
                    start_cursor = {5, 20}, -- Position cursor on 'T' of TARGET (line 5, column 20 - 0-based)
                    validation = {
                         type = 'check_buffer_content', -- Validation rule: check the entire buffer content
                         target_content = [[
" --- Exercise 1.3.1 ---
" Instruction: Press `i` to enter Insert mode. Type 'INSERTED ' before 'TARGET', then press `<Esc>`. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

Insert text before INSERTED TARGET here.]] -- Expected buffer content *including* the header lines
                    },
                    feedback = "You typed before the text correctly!",
                },
            },
        },
         lesson4 = {
            title = "Append (`a`)", -- Renamed slightly, check/reset explained in 1.2
             explanation = [[
Welcome to Lesson 1.4!

You've learned `i` for inserting *before* the cursor. Another common way to enter Insert mode is `a`.

The `a` key (for append) enters Insert mode *after* the character under the cursor. This is very useful for adding text at the end of a word or line.

Remember to use `exc` to check and `exr` to reset the exercise.
]],
            exercises = {
                {
                    instruction = "Use `a` to append ' my first edit' to the line below. Press `<Esc>` to return to Normal mode. Then type 'exc' to check.",
                    type = "insert_text",
                    setup_text = [[
" --- Exercise 1.4.1 ---
" Instruction: Use `a` to append ' my first edit' to the line below. Press `<Esc>` to return to Normal mode. Then type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

This is the line.]], -- Start text
                     start_cursor = {5, 20}, -- Cursor at the end of the line "This is the line." (line 5, column 20)
                    validation = {
                         type = 'check_buffer_content',
                         target_content = [[
" --- Exercise 1.4.1 ---
" Instruction: Use `a` to append ' my first edit' to the line below. Press `<Esc>` to return to Normal mode. Then type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

This is the line. my first edit]] -- Expected buffer content *including* header
                    },
                    feedback = "Append successful! You made your first edit.",
                },
            },
        },
         lesson5 = {
            title = "Saving (`:w`)",
             explanation = [[
Welcome to Lesson 1.5!

Saving your work is crucial. In Vim, this is often done using the command line.

From Normal mode, type `:` to enter Command-line mode. You'll see a `:` appear at the bottom of the screen.

Then type `w` (for write) and press `<Enter>`. The full command is `:w`.

Let's try it. (The tutorial simulates the save; it won't write a real file here). Remember `exc` to check.
]],
            exercises = {
                {
                    instruction = "Type `:w` and press `<Enter>` to simulate saving the current buffer. Type 'exc' to check.",
                    type = "command", -- Indicates this exercise is about executing a command
                    target_command = ":w", -- The command we expect the user to enter
                    setup_text = [[
" --- Exercise 1.5.1 ---
" Instruction: Type `:w` and press `<Enter>` to simulate saving the current buffer. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

This buffer needs saving. Changes were made here.]] ,
                    -- setup_state = { modified = true }, -- TODO: Need to programmatically set modified flag in init.lua before loading this exercise
                    validation = { type = 'check_command', target_command = ':w' }, -- Placeholder validation, needs command-line capture logic
                    feedback = "Buffer saved (in the tutorial)! The '*' marker (if visible) would disappear.",
                },
            },
        },
        lesson6 = {
            title = "Quitting (`:q!`, `:wq`, `:x`)",
             explanation = [[
Welcome to Lesson 1.6!

Knowing how to exit Vim is the ultimate survival skill.

From Normal mode, type `:`.
* `:q` - Quit. This only works if there are no unsaved changes.
* `:q!` - Quit *without* saving. **This is your panic button!** Use it to discard mistakes and exit immediately.
* `:wq` - Write (save) and quit. A very common command.
* `:x` - Write and quit. Similar to `:wq`, but only writes if changes were made.

Let's practice the escape route and a clean exit. (The tutorial simulates quitting). Remember `exc` to check.
]],
            exercises = {
                {
                    instruction = "Imagine you made a terrible mistake and want to exit *without* saving. Type `:q!` and press `<Enter>`. Then type 'exc' to check.",
                    type = "command",
                    target_command = ":q!",
                    setup_text = [[
" --- Exercise 1.6.1 ---
" Instruction: Type `:q!` and press `<Enter>` to quit without saving. Then type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

Make changes here, then abandon them.
Add some text.]],
                    -- setup_state = { modified = true }, -- TODO: Need to programmatically set modified flag
                    validation = { type = 'check_command', target_command = ':q!' }, -- Placeholder validation
                    feedback = "Emergency exit successful! You discarded changes.",
                },
                {
                    instruction = "Now, type `:wq` and press `<Enter>` to save and quit cleanly. Type 'exc' to check.",
                    type = "command",
                    target_command = ":wq",
                    setup_text = [[
" --- Exercise 1.6.2 ---
" Instruction: Now, type `:wq` and press `<Enter>` to save and quit cleanly. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

Make changes here that you want to save.
Add some text.]],
                    -- setup_state = { modified = true }, -- TODO: Need to programmatically set modified flag
                    validation = { type = 'check_command', target_command = ':wq' }, -- Placeholder validation
                    feedback = "Clean exit successful!",
                },
            },
        },
    },
    -- --- Module 2: Basic Navigation (The Home Row) ---
    -- Add Module 2 content here later, following the structure.
    module2 = {
        title = "Basic Navigation (The Home Row)",
        lesson1 = {
            title = "Moving Left and Right (`h`, `l`)",
            explanation = [[
Welcome to Module 2, Lesson 2.1!

Now that you know how to enter Normal mode and save/quit, let's learn to move around efficiently.

In Normal mode, the most basic movement keys are right under your fingers on the home row:
* `h` - Move one character **left**
* `l` - Move one character **right**

Try moving the cursor left and right in the exercise pane. Remember to use `exc` to check when you think you've completed the task!
]],
            exercises = {
                {
                    instruction = "Using only the `l` key, move the cursor to the character 'D'. Type 'exc' to check.",
                    type = "cursor_move", -- Indicates exercise is about cursor position
                    setup_text = [[
" --- Exercise 2.1.1 ---
" Instruction: Using only the `l` key, move the cursor to the character 'D'. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

ABCDEFG]],
                    start_cursor = {5, 0}, -- Cursor starts on 'A' (line 5, column 0)
                    validation = { type = 'check_cursor_position', target_cursor = {5, 3} }, -- Target cursor is on 'D' (line 5, column 3)
                    feedback = "Correct! You moved right.",
                },
                 {
                    instruction = "Using only the `h` key, move the cursor to the character 'E'. Type 'exc' to check.",
                    type = "cursor_move",
                    setup_text = [[
" --- Exercise 2.1.2 ---
" Instruction: Using only the `h` key, move the cursor to the character 'E'. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

ABCDEFG]],
                    start_cursor = {5, 6}, -- Cursor starts on 'G' (line 5, column 6)
                    validation = { type = 'check_cursor_position', target_cursor = {5, 4} }, -- Target cursor is on 'E' (line 5, column 4)
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

These are incredibly common movements. Practice moving up and down in the exercise pane. Remember `exc` to check.
]],
            exercises = {
                {
                    instruction = "Using only the `j` key, move the cursor down to 'Line 3'. Type 'exc' to check.",
                    type = "cursor_move",
                    setup_text = [[
" --- Exercise 2.2.1 ---
" Instruction: Using only the `j` key, move the cursor down to 'Line 3'. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

Line 1
Line 2
Line 3]],
                    start_cursor = {5, 0}, -- Cursor starts on Line 1 (line 5, column 0)
                    validation = { type = 'check_cursor_position', target_cursor = {7, 0} }, -- Target cursor is on Line 3 (line 7, column 0)
                    feedback = "Success! You moved down.",
                },
                {
                    instruction = "Using only the `k` key, move the cursor up to 'Line 1'. Type 'exc' to check.",
                    type = "cursor_move",
                    setup_text = [[
" --- Exercise 2.2.2 ---
" Instruction: Using only the `k` key, move the cursor up to 'Line 1'. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

Line 1
Line 2
Line 3]],
                    start_cursor = {7, 0}, -- Cursor starts on Line 3 (line 7, column 0)
                    validation = { type = 'check_cursor_position', target_cursor = {5, 0} }, -- Target cursor is on Line 1 (line 5, column 0)
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

Let's try navigating to a specific spot. Remember `exc` to check.
]],
            exercises = {
                {
                    instruction = "Navigate to the character 'X' in this text using only `h`, `j`, `k`, and `l`. Type 'exc' to check.",
                    type = "cursor_move",
                    setup_text = [[
" --- Exercise 2.3.1 ---
" Instruction: Navigate to the character 'X' in this text using only `h`, `j`, `k`, and `l`. Type 'exc' to check.
" Use 'exc' to check, 'exr' to reset.
" ---------------------------------------------

Move around here.
Find the X here.
Go to the X.]],
                    start_cursor = {5, 0}, -- Cursor starts at the beginning
                    validation = { type = 'check_cursor_position', target_cursor = {6, 12} }, -- Target cursor is on 'X' on line 6 (line 6, column 12)
                    feedback = "Great job navigating character by character!",
                },
            },
        },
    },
    -- --- Module 3: More Efficient Navigation (By Word) ---
    -- Add Module 3 content here later
    -- ...
}

return curriculum
