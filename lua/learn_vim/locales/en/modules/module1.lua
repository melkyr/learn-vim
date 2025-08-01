-- lua/learn_vim/modules/module1.lua
-- lua/learn_vim/locales/en/modules/module1.lua

-- This file contains the content for Module 1: The Vim Mindset & Survival Basics.
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')
local Locale = require('learn_vim.locale')
local lang = Locale.get_language()

local function get_exercise_path(filename)
    return "lua/learn_vim/locales/" .. lang .. "/exercise_content/" .. filename
end

return {
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

We've also set up two commands you can use from the Neovim command line (`:`):
* Type **`:LearnVim exc`** and press <Enter> to **check** if you've completed the current exercise.
* Type **`:LearnVim exr`** and press <Enter> to **reset** the current exercise back to its starting state.

Let's practice!
]],
        exercises = {
            {
                instruction = "You are currently in Insert mode. Press the `<Esc>` key to return to Normal mode. Then type `:LearnVim exc` to check.", -- Updated instruction
                type = "mode_switch", -- Indicates this exercise is about changing modes
                -- No setup_text needed, the plugin will programmatically put the buffer into Insert mode
                validation = { type = 'check_mode', target_mode = 'n' }, -- Validation rule: check if the final mode is Normal ('n')
                feedback = "Success! You are now in Normal mode.", -- Message shown on successful completion
            },
             {
                instruction = "Press `i` to enter Insert mode. Type some text, then press `<Esc>` again to return to Normal mode. After returning to Normal mode, type `:LearnVim exc` to check.", -- Updated instruction
                type = "mode_switch",
                setup_text = Utils.read_file_content(get_exercise_path("module1_lesson2_exercise2_setup.txt")),
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

Let's practice typing something *before* existing text. Remember to press `<Esc>` to return to Normal mode and then type `:LearnVim exc` to check.
]],
        exercises = {
            {
                instruction = "Press `i` to enter Insert mode. Type 'INSERTED ' before 'TARGET', then press `<Esc>`. Type `:LearnVim exc` to check.", -- Updated instruction
                type = "insert_text", -- Indicates this exercise is about inserting text
                setup_text = Utils.read_file_content(get_exercise_path("module1_lesson3_exercise1_setup.txt")),
                start_cursor = {5, 20}, -- Position cursor on 'T' of TARGET (line 5, column 20 - 0-based)
                validation = {
                     type = 'check_buffer_content', -- Validation rule: check the entire buffer content
                     target_content = Utils.read_file_content(get_exercise_path("module1_lesson3_exercise1_target.txt"))
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

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset the exercise from the command line.
]],
        exercises = {
            {
                instruction = "Use `a` to append ' my first edit' to the line below. Press `<Esc>` to return to Normal mode. Then type `:LearnVim exc` to check.", -- Updated instruction
                type = "insert_text",
                setup_text = Utils.read_file_content(get_exercise_path("module1_lesson4_exercise1_setup.txt")),
                 start_cursor = {5, 20}, -- Cursor at the end of the line "This is the line." (line 5, column 20)
                validation = {
                     type = 'check_buffer_content',
                     target_content = Utils.read_file_content(get_exercise_path("module1_lesson4_exercise1_target.txt"))
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

In this tutorial, attempting to save the exercise buffer will show an error because it's a special buffer. That's expected!

**Your task:** Type `:w` and press `<Enter>`. You will see an error message. Then type `:LearnVim exc` to check.
]], -- Updated explanation
        exercises = {
            {
                instruction = "Type `:w` and press `<Enter>`. Then type `:LearnVim exc` to check.", -- Updated instruction
                type = "command",
                target_command = ":w",
                setup_text = Utils.read_file_content(get_exercise_path("module1_lesson5_exercise1_setup.txt")),
                -- setup_state = { modified = true }, -- TODO: Need to programmatically set modified flag in init.lua before loading this exercise
                validation = { type = 'check_command', target_command = ':w' }, -- Validation updated in exercise.lua
                feedback = "You attempted to save! The error message confirms you used the command.", -- Updated feedback
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

In this tutorial, these commands won't actually close Neovim, but they will affect your saved progress.

**Your task:**
1.  Imagine you made a terrible mistake and want to exit *without* saving. Type `:q!` and press `<Enter>`.
2.  Type `:LearnVim exc` to check.
3.  **Important:** To see that your progress was *not* saved by `:q!` (because the tutorial buffer is scratch), type `:qall` to exit Neovim completely. Then restart Neovim and type `:LearnVim start`. You should be back at Lesson 1.6.
]], -- Updated explanation
        exercises = {
            {
                instruction = "Type `:q!` and press `<Enter>`. Then type `:LearnVim exc` to check. Exit and restart Neovim to verify progress was not saved.", -- Updated instruction
                type = "command",
                target_command = ":q!",
                setup_text = Utils.read_file_content(get_exercise_path("module1_lesson6_exercise1_setup.txt")),
                -- setup_state = { modified = true }, -- TODO: Need to programmatically set modified flag
                validation = { type = 'check_command', target_command = ':q!' }, -- Validation updated in exercise.lua
                feedback = "You attempted to quit without saving! Now exit Neovim completely (:qall), restart, and type :LearnVim start to see you're still on this lesson.", -- Updated feedback
            },
            {
                instruction = "Now, type `:wq` and press `<Enter>` to save and quit cleanly. Type `:LearnVim exc` to check. Exit and restart Neovim to verify progress was saved.", -- Updated instruction
                type = "command",
                target_command = ":wq",
                setup_text = Utils.read_file_content(get_exercise_path("module1_lesson6_exercise2_setup.txt")),
                -- setup_state = { modified = true }, -- TODO: Need to programmatically set modified flag
                validation = { type = 'check_command', target_command = ':wq' }, -- Validation updated in exercise.lua
                feedback = "You attempted to save and quit! Now exit Neovim completely (:qall), restart, and type :LearnVim start. You should move to the next lesson.", -- Updated feedback
            },
        },
    },
}

