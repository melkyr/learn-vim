-- lua/learn_vim/modules/module6.lua

-- This file contains the content for Module 6: Visual Mode.
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')

return {
    title = "Visual Mode",
    lesson1 = {
        title = "Introduction to Visual Mode (`v`)",
        explanation = [[
Welcome to Module 6, Lesson 6.1!

So far, you've learned to combine an operator (like `d` or `c`) with a movement (like `w` or `$` or `j`). This is often called **operator-pending mode**.

Vim also has **Visual Mode**, which is more like selecting text in traditional editors. You enter Visual Mode, select a block of text using movement commands, and *then* apply an operator to the selection.

There are three types of Visual Mode:
1.  **Character Visual (`v`)**: Selects text character by character.
2.  **Line Visual (`V`)**: Selects entire lines.
3.  **Block Visual (`<C-v>`)**: Selects a rectangular block of text.

You exit any Visual Mode by pressing `<Esc>`.

Let's start with **Character Visual mode** (`v`). Press `v` in Normal mode, move the cursor to select text, then press `<Esc>` to exit. Use `:LearnVim exc` to check if you entered and exited Visual mode.
]],
        exercises = {
            {
                instruction = "Press `v` to enter Character Visual mode, move the cursor to select some text, then press `<Esc>` to return to Normal mode. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- We'll check the final mode is Normal
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson1_exercise1_setup.txt"),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Check if they returned to Normal mode
                feedback = "You entered and exited Character Visual mode!",
            },
             {
                instruction = "Press `v`, move right 5 characters using `l`, then press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Still checking final mode is Normal
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson1_exercise2_setup.txt"),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' },
                feedback = "You selected characters using 'l' in Visual mode!",
            },
        },
    },
    lesson2 = {
        title = "Line Visual (`V`)",
        explanation = [[
Welcome to Lesson 6.2!

The second type of Visual Mode is **Line Visual** (`V`). Pressing `V` in Normal mode selects the entire current line and enters Line Visual mode. Moving the cursor up or down will extend the selection to include those lines.

This is very convenient for selecting one or more whole lines quickly.

Press `V` to enter Line Visual mode, move up or down to select lines, then press `<Esc>` to exit. Use `:LearnVim exc` to check.
]],
        exercises = {
            {
                instruction = "Press `V` to enter Line Visual mode, move down 2 lines using `j`, then press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check final mode is Normal
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson2_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Start on Line 1
                validation = { type = 'check_mode', target_mode = 'n' },
                feedback = "You selected lines using 'V' and 'j'!",
            },
             {
                instruction = "Press `V` to enter Line Visual mode, move up 3 lines using `k`, then press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check final mode is Normal
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson2_exercise2_setup.txt"),
                start_cursor = {9, 0}, -- Start on Line 5
                validation = { type = 'check_mode', target_mode = 'n' },
                feedback = "You selected lines using 'V' and 'k'!",
            },
        },
    },
    lesson3 = {
        title = "Block Visual (`<C-v>`)",
        explanation = [[
Welcome to Lesson 6.3!

The third type of Visual Mode is **Block Visual** (`<C-v>`). Pressing `<C-v>` (Control + v) in Normal mode starts a rectangular block selection. Moving the cursor will expand this block.

This is particularly useful for editing columns of text or inserting/deleting text in a specific vertical block across multiple lines.

Press `<C-v>` to enter Block Visual mode, move the cursor to select a block, then press `<Esc>` to exit. Use `:LearnVim exc` to check.
]],
        exercises = {
            {
                instruction = "Press `<C-v>` to enter Block Visual mode, move right 3 characters and down 2 lines to select a block, then press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check final mode is Normal
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson3_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Start at the top-left of the block
                validation = { type = 'check_mode', target_mode = 'n' },
                feedback = "You selected a block of text!",
            },
        },
    },
    lesson4 = {
        title = "Actions on Visual Selections",
        explanation = [[
Welcome to Lesson 6.4!

Once you have a visual selection (using `v`, `V`, or `<C-v>`), you can apply many Normal mode operators directly to the selection. The operator will affect *all* the text within the selection.

Common operators to use on a visual selection:
* `d` - Delete the selection.
* `c` - Change the selection (deletes and enters Insert mode).
* `y` - Yank (copy) the selection.
* `>` - Indent the selection.
* `<` - Dedent the selection.

Let's practice applying actions to visual selections. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Use `v` to select the word 'delete', then press `d` to delete it. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson4_exercise1_setup.txt"),
                start_cursor = {5, 7}, -- Cursor on 'd' of 'delete'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson4_exercise1_target.txt")
                },
                feedback = "You deleted the visual selection!",
            },
             {
                instruction = "Use `V` to select the line 'Change this line.', then press `c` to change it. Type 'This line is changed.' and press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson4_exercise2_setup.txt"),
                start_cursor = {6, 0}, -- Cursor on the line to change
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson4_exercise2_target.txt")
                },
                feedback = "You changed the visual selection!",
            },
             {
                instruction = "Use `<C-v>` to select the 'Column' text in the first two lines. Press `d` to delete the block. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson4_exercise3_setup.txt"),
                start_cursor = {5, 0}, -- Start at the top-left of the block
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module6_lesson4_exercise3_target.txt")
                },
                feedback = "You deleted the block selection!",
            },
        },
    },
    lesson5 = {
        title = "Visual Mode vs. Operator-Pending Mode",
        explanation = [[
Welcome to Lesson 6.5!

You've now seen two ways to perform actions:
1.  **Operator-Pending Mode (e.g., `dw`)**: Operator first, then movement. `d` waits for a movement command (`w`) to know what to delete.
2.  **Visual Mode (e.g., `vd`)**: Enter Visual mode (`v`), select text with movements, then apply operator (`d`).

Both achieve similar results, but Visual Mode can be more intuitive for some tasks, especially when the selection is complex or you want to see exactly what you're affecting before committing the action.

For simple, common actions (like deleting a word or line), operator-pending mode is often faster (`dw` vs `vwd`). For more complex selections or when you're unsure of the exact movement needed, Visual Mode can be easier.

There's no exercise for this lesson, just a summary. You now have a powerful tool for selecting and manipulating text visually!

Type `:LearnVim next` to continue to the next module (if available) or finish the tutorial.
]],
        exercises = {}, -- No exercises for this summary lesson
    },
    -- Add more lessons for Module 6 here
    -- lesson6 = { ... }
}

