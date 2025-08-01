-- lua/learn_vim/modules/module0.lua
-- lua/learn_vim/locales/en/modules/module0.lua

-- This file contains the content for Module 0: Essential First Steps.
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')
local Locale = require('learn_vim.locale')
local lang = Locale.get_language()

local function get_exercise_path(filename)
    return "lua/learn_vim/locales/" .. lang .. "/exercise_content/" .. filename
end

return {
    title = "Module 0: Essential First Steps",

    lesson1 = {
        title = "Exiting Vim: Your Essential Escape Routes",
        explanation = [[
Welcome to your very first lesson! The most crucial skill for any Vim beginner is knowing how to exit the editor. It's a common joke that people get trapped in Vim, but after this lesson, that won't be you!

Vim operates in different modes. To enter commands like 'quit', you need to be in Normal Mode. If you're in Insert Mode (where you type text), press `<Esc>` to return to Normal Mode. You'll know you're in Normal Mode when your typed keys don't appear as text on the screen.

Once in Normal Mode, type `:` to enter Command-line mode. You'll see a colon appear at the bottom-left of your screen. Here are the essential exit commands:

*   `:q`  - Quit. This command closes the current file or Vim if it's the last open file. It only works if there are no unsaved changes. If there are unsaved changes, Vim will give you a warning.

*   `:q!` - Quit WITHOUT saving (the '!' forces the action). This is your emergency exit. If you've made changes you don't want to keep, or you just want to get out, this is the command to use.

*   `:wq` - Write (save) AND quit. This saves your changes to the file and then exits Vim. It's a very common way to exit.

*   `:x`  - Write and quit (similar to `:wq`). This command also saves changes and exits. The subtle difference is that `:x` only writes the file if it has been modified, whereas `:wq` will always write the file (and update its timestamp) even if no changes were made.

For this tutorial:
- Use `:LearnVim exc` to check your exercise attempt.
- Use `:LearnVim exr` to reset an exercise.
- These exit commands (`:q`, `:q!`, `:wq`, `:x`) won't actually close the tutorial environment but will be checked as if you typed them.
]],
        exercises = {
            {
                instruction = "You've made some imaginary changes and want to exit without saving. Type `:q!` and press <Enter>. Then type `:LearnVim exc` to check.",
                type = "command",
                target_command = ":q!",
                -- No setup_text needed for a simple command check
                validation = { type = 'check_command', target_command = ':q!' },
                feedback = "Correct! `:q!` is the way to force quit without saving. You're not trapped!",
            },
            {
                instruction = "Now, imagine you've finished your work and want to save and exit. Type `:wq` and press <Enter>. Then type `:LearnVim exc` to check.",
                type = "command",
                target_command = ":wq",
                validation = { type = 'check_command', target_command = ':wq' },
                feedback = "Excellent! `:wq` saves your work and quits. You've mastered exiting Vim!",
            },
        },
    }, -- Note the comma here

    lesson2 = {
        title = "Moving Around: Up, Down, Left, Right",
        explanation = [[
Now that you know how to exit, let's learn how to move! In Vim's Normal Mode, you don't use the mouse. Instead, you use keyboard keys for navigation. This might seem strange at first, but it's much more efficient once you get used to it, as your hands never leave the keyboard.

The most fundamental movement keys are:

+===================================+
|         BASIC CURSOR MOTION       |
+===================================+
|                                     |
|              [ k ] ↑                |
|        [ h ] ←     → [ l ]          |
|              [ j ] ↓                |
|                                     |
+-------------------------------------+
| ← [h] Left    ↓ [j] Down    ↑ [k] Up    → [l] Right |
+===================================+

*   `h` - moves the cursor one character to the Left.
*   `j` - moves the cursor one line Down.
*   `k` - moves the cursor one line Up.
*   `l` - moves the cursor one character to the Right.

Think of `j` as having a little arrow pointing down. `k` is above `j`, and `h` and `l` are to the left and right on a standard keyboard layout.

It takes practice, but these will become second nature. Try to avoid using the arrow keys!
]],
        exercises = {
            {
                instruction = "Use h, j, k, l to navigate to the character '[X]' in the text below. Once your cursor is on '[X]', press 'r' (replace mode) then 'O' (the capital letter O) to change it to '[O]'. Press <Esc> to return to Normal mode. Then type :LearnVim exc to check.",
                type = "text_manipulation", -- Or a more generic type if appropriate
                setup_text = Utils.read_file_content(get_exercise_path("module0_lesson2_exercise1_setup.txt")),
                start_cursor = {1, 1}, -- Start at the beginning of the file (line 1, column 1)
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module0_lesson2_exercise1_target.txt"))
                },
                feedback = "Great job! You've successfully navigated and made a change using basic motion keys.",
            },
        },
    }, -- Note the comma here

    lesson3 = {
        title = "Jumping Further: Words and Lines",
        explanation = [[
Moving character by character with h, j, k, l is fundamental, but Vim offers more powerful motions to jump around your code faster.

+===================================+
|       WORD & LINE MOTIONS         |
+===================================+
|                                     |
|  [ w ] → Jump to start of next word |
|  [ b ] ← Jump to start of prev word |
|  [ e ] → Jump to end of current word|
|                                     |
|  [ 0 ] ↖ Go to first non-blank char |
|  [ ^ ] ↖ Go to first non-blank char (more precise) |
|  [ $ ] ↗ Go to last  column         |
|                                     |
+-------------------------------------+
|  w  b  e   0  ^  $   – all in Normal mode |
+===================================+

*   `w` (word): Moves the cursor to the beginning of the next word.
*   `b` (back): Moves the cursor to the beginning of the previous word.
*   `e` (end): Moves the cursor to the end of the current word (or next word if already at the end).

For line motions:
*   `0` (zero): Moves the cursor to the very first character of the line (column 0).
*   `^` (caret): Moves the cursor to the first non-blank character of the line. This is often more useful than `0`.
*   `$` (dollar): Moves the cursor to the end of the line.

Try these out! They significantly speed up navigation within lines.
]],
        exercises = {
            {
                instruction = "The cursor will start at the beginning of the second line. Use 'w' to move to the beginning of the third word ('several'). Then type 'cw' (change word), type 'many', and press <Esc>. Then type :LearnVim exc to check.",
                type = "text_manipulation",
                setup_text = Utils.read_file_content(get_exercise_path("module0_lesson3_exercise1_setup.txt")),
                start_cursor = {2, 1}, -- Start at "This line has..." (line 2, col 1)
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module0_lesson3_exercise1_target.txt")) -- To be created
                },
                feedback = "Perfect! 'w' and 'cw' are a powerful combo.",
            },
            {
                instruction = "The cursor will start at the beginning of the last line. Use '$' to move to the end of the line (after '[TARGET_EOL]'). Then press 'a' (append), type ' ADDED_TEXT', and press <Esc>. Then type :LearnVim exc to check.",
                type = "text_manipulation",
                setup_text = Utils.read_file_content(get_exercise_path("module0_lesson3_exercise1_setup.txt")),
                start_cursor = {7, 1}, -- Start at "Another line for..." (line 7, col 1, assuming file content is as planned)
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module0_lesson3_exercise2_target.txt")) -- To be created
                },
                feedback = "Excellent! '$' takes you right to the end, and 'a' lets you append.",
            },
        },
    }, -- Comma after lesson3

    lesson4 = {
        title = "Seeing the Big Picture: Navigating Files",
        explanation = [[
Moving around lines and words is great, but what about larger distances? Vim has commands to move through entire files and screens.

+===================================+
|      FILE-WIDE NAVIGATION         |
+===================================+
|                                     |
|  [ gg ] ↖ Go to top of file         |
|  [ G  ] ↘ Go to bottom of file      |
|                                     |
|  [Ctrl-f] ↓ Page forward            |
|  [Ctrl-b] ↑ Page backward           |
|                                     |
|  [ H ] ↑ Move to top of screen      |
|  [ M ] · Move to middle of screen   |
|  [ L ] ↓ Move to bottom of screen   |
|                                     |
+-------------------------------------+
|  “Edge” commands vs. “Screen” cmds   |
+===================================+

File-level jumps:
*   `gg`: Go to the very first line of the file.
*   `G` (Shift + g): Go to the very last line of the file. You can also type a number then `G` (e.g., `10G`) to go to line 10.

Paging:
*   `Ctrl-f` (Control + f): Moves one full screen Forward (down).
*   `Ctrl-b` (Control + b): Moves one full screen Backward (up).
(Note: `Ctrl-d` for down half page and `Ctrl-u` for up half page are also very useful!)

Screen-level (current view):
These commands move you within what's currently visible on your screen.
*   `H` (High): Moves the cursor to the top line of the screen.
*   `M` (Middle): Moves the cursor to the middle line of the screen.
*   `L` (Low): Moves the cursor to the bottom line of the screen.

Mastering these will make you feel like you're flying through your files!
]],
        exercises = {
            {
                instruction = "You'll start somewhere in the middle of a long file. Go to the very TOP of the file using 'gg'. The first line contains '=== TOP OF THE FILE ==='. Change the 'T' in 'TOP' to 'X'. Press <Esc>. Then type :LearnVim exc to check.",
                type = "text_manipulation",
                setup_text = Utils.read_file_content(get_exercise_path("module0_lesson4_exercise1_setup.txt")),
                start_cursor = {35, 1}, -- Start at "This is line 35." (middle of the file)
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module0_lesson4_exercise1_target.txt")) -- To be created
                },
                feedback = "Zap! 'gg' takes you straight to the top!",
            },
            {
                instruction = "You'll start somewhere in the middle. Go to the very BOTTOM of the file using 'G'. The last line contains '=== BOTTOM OF THE FILE ==='. Change the 'B' in 'BOTTOM' to 'Y'. Press <Esc>. Then type :LearnVim exc to check.",
                type = "text_manipulation",
                setup_text = Utils.read_file_content(get_exercise_path("module0_lesson4_exercise1_setup.txt")),
                start_cursor = {35, 1}, -- Start at "This is line 35."
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module0_lesson4_exercise2_target.txt")) -- To be created
                },
                feedback = "Zoom! 'G' drops you right at the end!",
            },
            {
                instruction = "You'll start at the top of the file. Scroll down a bit if needed to make sure there's text above and below your current view. Then, move your cursor to the MIDDLE line of the CURRENT SCREEN using 'M'. The line should be 'This is line 35. [SCREEN_MIDDLE_TARGET]'. Change the '[S]' in '[SCREEN_MIDDLE_TARGET]' to '[Z]'. Press <Esc>. Then type :LearnVim exc to check. (Note: exact line for 'M' depends on your screen size, the setup text has a marker.)",
                type = "text_manipulation",
                setup_text = Utils.read_file_content(get_exercise_path("module0_lesson4_exercise1_setup.txt")),
                start_cursor = {1, 1}, -- Start at the top of the file
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module0_lesson4_exercise3_target.txt")) -- To be created
                },
                feedback = "Nicely done! 'M' helps you orient yourself on the screen quickly.",
            },
        },
    } -- No comma after the last lesson in the module
}
