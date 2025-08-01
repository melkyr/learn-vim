-- lua/learn_vim/modules/module8.lua
-- lua/learn_vim/locales/en/modules/module8.lua

-- This file contains the content for Module 8: Command-line Mode and Registers.
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')
local Locale = require('learn_vim.locale')
local lang = Locale.get_language()

local function get_exercise_path(filename)
    return "lua/learn_vim/locales/" .. lang .. "/exercise_content/" .. filename
end

return {
    title = "Command-line Mode and Registers",
    lesson1 = {
        title = "Introduction to Command-line Mode (`:`)", -- Changed backticks to single quotes
        explanation = [[
Welcome to Module 8, Lesson 8.1!

You've already used Command-line mode for saving (':w'), quitting (':q'), and interacting with the tutorial (':LearnVim ...'). Command-line mode is a powerful interface for executing commands, running external programs, and performing complex actions.

You enter Command-line mode from Normal mode by typing ':'. A ':' prompt appears at the bottom of the screen, where you type your command. Press '<Enter>' to execute the command, or '<Esc>' to cancel and return to Normal mode.

Many commands can be executed here, including file operations, global substitutions, and setting options.

Let's practice entering and exiting Command-line mode. Use ':LearnVim exc' to check and ':LearnVim exr' to reset.
]], -- Changed backticks to single quotes
        exercises = {
            {
                instruction = "Type ':' to enter Command-line mode, then press '<Esc>' to return to Normal mode. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "mode_switch", -- Check final mode is Normal
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson1_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' },
                feedback = "You entered and exited Command-line mode!",
            },
             {
                instruction = "Type ':set number' and press '<Enter>' to show line numbers in the exercise pane. Then type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "command", -- We'll check if the option is set
                target_command = ":set number", -- The command to execute
                 -- Validation for this will need to check the 'number' option is true.
                 -- We might need to add a new validation type or check option state directly in exercise.lua.
                 -- For now, let's use a placeholder and rely on the instruction.
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson1_exercise2_setup.txt")),
                validation = { type = 'check_mode', target_mode = 'n' }, -- Placeholder: check they returned to Normal mode
                feedback = "You executed a command to set an option!",
                -- TODO: Implement a proper validation check for option values.
            },
        },
    },
    lesson2 = {
        title = "Ranges with Commands",
        explanation = [[
Welcome to Lesson 8.2!

Many Command-line mode commands can operate on a specific **range** of lines, rather than just the current line or the whole file.

A range is specified before the command, typically using line numbers or symbols:
* ':' : No range specified, usually applies to the current line.
* ':1,5' : Lines 1 through 5.
* ':.,$' : From the current line ('.') to the last line ('$').
* ':%' : The entire file (same as ':1,$').
* ':g/pattern/' : All lines matching 'pattern'.

Let's practice using ranges with the ':delete' command (':d'). Use ':LearnVim exc' to check and ':LearnVim exr' to reset.
]], -- Changed backticks to single quotes
        exercises = {
            {
                instruction = "Using a range with ':d', delete lines 7 through 9. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson2_exercise1_setup.txt")),
                start_cursor = {5, 0}, -- Start at the top
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module8_lesson2_exercise1_target.txt"))
                },
                feedback = "You deleted a range of lines!",
            },
             {
                instruction = "Using the ':%' range with ':s', replace all occurrences of 'old' with 'new' in the entire buffer. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson2_exercise2_setup.txt")),
                start_cursor = {5, 0},
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module8_lesson2_exercise2_target.txt"))
                },
                feedback = "You performed a global substitution with a range!",
            },
        },
    },
    lesson3 = {
        title = "Introduction to Registers ('\"')", -- Changed backticks to single quotes
        explanation = [[
Welcome to Lesson 8.3!

Vim has multiple **registers** that act like clipboards or storage areas for text. When you delete or yank text, it's stored in a register. When you paste, you retrieve text from a register.

The default register is the **unnamed register** ('"'). When you use 'yy', 'dd', 'yw', 'dw', etc., the text goes into the unnamed register. 'p' and 'P' paste from the unnamed register by default.

You can specify a register to use by typing '"{register_name}' before a yank, delete, or put command.

For example:
* '"ayy' - Yank the current line into register 'a'.
* '"bdw' - Delete a word into register 'b'.
* '"ap' - Paste the content of register 'a'.

Registers are named with single letters ('a' through 'z').

Let's practice using named registers. Use ':LearnVim exc' to check and ':LearnVim exr' to reset.
]], -- Changed backticks to single quotes
        exercises = {
            {
                instruction = "Yank the word 'YANK' into register 'a' using '\"ayw'. Then move to the line below and paste from register 'a' using '\"ap'. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text",
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson3_exercise1_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on 'Y' of 'YANK'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module8_lesson3_exercise1_target.txt"))
                },
                feedback = "You yanked and pasted using a named register!",
            },
             {
                instruction = "Delete the line 'DELETE THIS' into register 'b' using '\"bdd'. Then move to the line below 'Paste here:' and paste from register 'b' using '\"bp'. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text",
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson3_exercise2_setup.txt")),
                start_cursor = {6, 0}, -- Cursor on the line to delete
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module8_lesson3_exercise2_target.txt"))
                },
                feedback = "You deleted and pasted using a named register!",
            },
        },
    },
    lesson4 = {
        title = "Special Registers",
        explanation = [[
Welcome to Lesson 8.4!

Besides the named registers ('a' through 'z'), Vim has several **special registers** that store specific types of information automatically.

Some useful special registers:
* '"' (unnamed register): The default register for yank and delete operations.
* '0' (yank register): Stores the text from the *last* yank operation (only yanks, not deletes).
* '%' : The name of the current file.
* '#' : The name of the alternate file.
* ':' : The last executed command-line command.
* '/' : The last search pattern.
* '.' : The last inserted text.

You access these using '"{register_name}' just like named registers. For example, '"".' pastes the last inserted text.

Let's practice using a few special registers. Use ':LearnVim exc' to check and ':LearnVim exr' to reset.
]], -- Changed backticks to single quotes
        exercises = {
            {
                instruction = "Insert some text (e.g., 'hello'). Press '<Esc>'. Then move to the next line and paste the inserted text using '\".p'. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text",
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson4_exercise1_setup.txt")),
                start_cursor = {5, 18}, -- Cursor after "Insert text here:"
                validation = {
                    type = 'check_buffer_content',
                    -- We can't know *exactly* what they inserted, but we can check if *something*
                    -- was pasted after the second line that wasn't there initially.
                    -- A simpler validation is to check if the second line is no longer empty.
                    target_content = Utils.read_file_content(get_exercise_path("module8_lesson4_exercise1_target.txt"))
                },
                feedback = "You pasted the last inserted text!",
                -- TODO: Improve validation to check if the pasted text matches the inserted text.
            },
             {
                instruction = "Yank the word 'YANKED' using 'yw'. Then move to the next line and paste *only* the yanked text (not deleted text) using '\"0p'. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text",
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson4_exercise2_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on 'Y' of 'YANKED'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module8_lesson4_exercise2_target.txt"))
                },
                feedback = "You pasted specifically from the yank register!",
            },
        },
    },
    lesson5 = { -- New lesson for the black hole register
        title = "The Black Hole Register ('_')", -- Changed backticks to single quotes
        explanation = [[
Welcome to Lesson 8.5!

Sometimes you want to delete text but **not** have it stored in any register (including the unnamed register). This is useful when you don't want a deletion to overwrite the text you have ready to paste.

The **black hole register** ('_') is used for this. Text deleted into the black hole register is gone forever and cannot be pasted.

You use it like any other register: type '"_' before a delete command.

For example:
* '"__dd' - Delete the current line into the black hole register.
* '"_dw' - Delete a word into the black hole register.

Let's practice deleting text without affecting the paste buffer. Use ':LearnVim exc' to check and ':LearnVim exr' to reset.
]], -- Changed backticks to single quotes
        exercises = {
            {
                instruction = "Yank the word 'YANKED' using 'yw'. Then, delete the word 'DELETE' using '\"_dw' (into the black hole register). Finally, paste using 'p'. The pasted text should be 'YANKED', not 'DELETE'. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text",
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson5_exercise1_setup.txt")),
                start_cursor = {5, 0}, -- Start on 'Y' of 'YANKED'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module8_lesson5_exercise1_target.txt"))
                },
                feedback = "You used the black hole register to delete without affecting the paste buffer!",
            },
        },
    },
    lesson6 = { -- New lesson for the selection register
        title = "The Selection and Clipboard Registers ('*', '+')", -- Changed backticks to single quotes
        explanation = [[
Welcome to Lesson 8.6!

Vim can interact with your system's clipboard through special registers. This allows you to copy and paste text between Neovim and other applications.

The most common registers for this are:
* '*' (the asterisk register): This register is typically linked to the **primary selection**. On Linux/X11, this is the text highlighted with the mouse. Pasting with the middle mouse button often uses this register.
* '+' (the plus register): This register is typically linked to the **clipboard selection**. This is the text copied using 'Ctrl+C' (or equivalent) and pasted using 'Ctrl+V' (or equivalent) in other applications.

You use these like any other register: '"*y{movement}', '"+y{movement}', '"*p', '"+p'.

For example:
* '"*yy' - Yank the current line into the primary selection (can paste with middle click elsewhere).
* '"+dd' - Delete the current line into the system clipboard (can paste with Ctrl+V elsewhere).
* '"*p' - Paste from the primary selection.
* '"+p' - Paste from the system clipboard.

Let's practice using the selection and clipboard registers. Use ':LearnVim exc' to check and ':LearnVim exr' to reset.
]], -- Changed backticks to single quotes
        exercises = {
            {
                instruction = "Yank the word 'CLIPBOARD' into the system clipboard using '\"+yw'. Then move to the next line and paste from the system clipboard using '\"+p'. Type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text",
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson6_exercise1_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on 'C' of 'CLIPBOARD'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module8_lesson6_exercise1_target.txt"))
                },
                feedback = "You yanked to and pasted from the system clipboard!",
            },
            -- Note: Exercises for the '*' register are harder to validate programmatically
            -- as they depend on external mouse actions or pasting outside Vim.
            -- The explanation provides the necessary information.
        },
    },
     lesson7 = { -- New lesson for testing system clipboard
        title = "Testing System Clipboard Integration",
        explanation = [[
Welcome to Lesson 8.7!

You've learned about the '*' and '+' registers for interacting with your system's clipboard. However, getting clipboard integration to work correctly in Neovim sometimes requires additional setup depending on your operating system and how Neovim was installed.

You can check if Neovim has clipboard support compiled in by typing ':version' and looking for '+clipboard' or '+xterm_clipboard'. If you see '-clipboard', it means it's not enabled.

If clipboard support is enabled but still not working, you might need to install an external program that Neovim uses to communicate with the system clipboard (like 'xclip' or 'xsel' on Linux, or ensure 'gvim' is installed on Windows). The ':checkhealth' command can sometimes provide hints.

Let's test if your system clipboard integration is working:

**Test 1: Paste *into* Neovim**
1.  Go to an external application (like a web browser or text editor).
2.  Copy some text from there using your system's normal copy command (e.g., Ctrl+C or Cmd+C).
3.  Return to Neovim, move your cursor to the line below "Paste external text here:", and type '"+p' to paste from the system clipboard.

**Test 2: Copy *from* Neovim**
1.  Yank the line "COPY THIS LINE TO EXTERNAL APP" into the system clipboard by placing your cursor on it and typing '\"+yy'.
2.  Go to an external application and paste the text there using your system's normal paste command (e.g., Ctrl+V or Cmd+V).

If both tests work, your clipboard integration is likely set up correctly!

If it doesn't work:
* Type ':version' and check for '+clipboard'.
* Type ':checkhealth' and look for clipboard-related messages.
* Search online for "neovim clipboard not working [your operating system]".

Once you have successfully pasted the text into the exercise buffer using '"+p', type ':LearnVim exc' to proceed. (We can only programmatically check the paste *into* Neovim).
]], -- Changed backticks to single quotes
        exercises = {
            {
                instruction = "Copy text from an external application and paste it into the line below 'Paste external text here:' using '\"+p'. Then type ':LearnVim exc' to check.", -- Changed backticks to single quotes
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module8_lesson7_exercise1_setup.txt")),
                start_cursor = {6, 18}, -- Cursor after "Paste external text here:"
                validation = {
                    type = 'check_buffer_content_contains', -- Need a new validation type
                    target_content_snippet = "Paste external text here:", -- Check if the line *starts* with this
                    min_length_after_snippet = 1 -- Check if there's *any* text after the snippet
                },
                feedback = "You attempted to paste from the system clipboard! Check if the text appeared.",
                -- TODO: Implement 'check_buffer_content_contains' validation type.
            },
            -- The second part (copying *from* Neovim) is hard to validate automatically,
            -- so it's part of the instruction for the user to verify externally.
        },
    },
    -- Add more lessons for Module 8 here if needed (e.g., paste from command-line history register)
    -- lesson8 = { ... }
}
