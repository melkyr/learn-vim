-- lua/learn_vim/modules/module12.lua
-- lua/learn_vim/locales/en/modules/module12.lua

-- This file contains the content for Module 12: Buffers, Windows, and Tabs.
-- It introduces these core concepts and provides exercises for practical use.

local Utils = require('learn_vim.utils')
local Locale = require('learn_vim.locale')
local lang = Locale.get_language()

local function get_exercise_path(filename)
    return "lua/learn_vim/locales/" .. lang .. "/exercise_content/" .. filename
end

return {
    title = "Buffers, Windows, and Tabs",
    lesson1 = {
        title = "Introduction to Buffers, Windows, and Tabs",
        explanation = [[
Welcome to Module 12, Lesson 12.1!

Neovim allows you to work with multiple files and views simultaneously using three core concepts:

* **Buffers:** A buffer is the in-memory text of a file. When you open a file, it's loaded into a buffer. Even if you close the window displaying a buffer, the buffer (and its content and state) might still exist in memory.
* **Windows:** A window is a viewport onto a buffer. You can have multiple windows open at once, displaying different buffers or even different parts of the *same* buffer. Windows are arranged within a tab page.
* **Tabs (Tab Pages):** A tab page is a collection of one or more windows. You can have multiple tab pages open, each with its own layout of windows.

Think of it like this:
- **Buffer:** The document itself.
- **Window:** A frame displaying a document.
- **Tab Page:** A desk with one or more frames on it.

Let's start by looking at your current buffers. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Type `:ls` and press <Enter> to list your current buffers. You should see at least two: one for the tutorial text and one for the exercise pane. Press <Enter> again to dismiss the listing. Type `:LearnVim exc` to check.",
                type = "command", -- Check if the command was likely executed (by checking mode)
                target_command = ":ls",
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson1_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation: back to Normal mode
                feedback = "You listed your buffers!",
            },
        },
    },
    lesson2 = {
        title = "Navigating Buffers (`:bnext`, `:bprev`, `:bd`)",
        explanation = [[
Welcome to Lesson 12.2!

When you have multiple buffers open, you can navigate between them using command-line commands:

* **`:bnext`** (or **`:bn`**): Go to the next buffer in the buffer list.
* **`:bprev`** (or **`:bp`**): Go to the previous buffer in the buffer list.
* **`:buffer {number_or_name}`** (or **`:b {number_or_name}`**): Go to a specific buffer by its number (seen in `:ls`) or part of its name.
* **`:bfirst`** / **`:blast`**: Go to the first/last buffer.
* **`:bd`** (or **`:bdelete`**): Delete the current buffer from memory. Use with caution! If the buffer is the last one visible in a window, the window might close.

Let's practice navigating buffers. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Type `:bnext` and press <Enter> to switch to the next buffer. Then type `:bprev` and press <Enter> to switch back to this exercise buffer. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson2_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module12_lesson2_exercise1_target.txt"))
                },
                feedback = "You navigated between buffers!",
            },
             {
                instruction = "Type `:bd` and press <Enter> to delete this exercise buffer. (Don't worry, the tutorial will recreate it). Type `:LearnVim exc` to check after deleting.",
                type = "insert_text", -- Check buffer content - this will fail as buffer is deleted
                -- This exercise is tricky to validate directly. The goal is for the user
                -- to execute `:bd`. The tutorial will handle the buffer being deleted
                -- and loading the next exercise. We can't check content *after* deletion.
                -- Let's rely on the user following instructions and the tutorial
                -- automatically loading the next exercise.
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson2_exercise2_setup.txt")),
                start_cursor = {5, 0},
                validation = {
                    type = 'check_mode', -- Placeholder: just check they are back in Normal mode
                    target_mode = 'n'
                },
                feedback = "You deleted the buffer!",
                -- TODO: Find a more robust way to validate buffer deletion, maybe check buffer list from init.lua?
            },
        },
    },
    lesson3 = {
        title = "Splitting Windows (`:split`, `:vsplit`)",
        explanation = [[
Welcome to Lesson 12.3!

Windows allow you to view multiple buffers (or the same buffer) side-by-side within a single tab page.

* **`:split`** ( or **`:sp`**): Split the current window horizontally. The new window will display the same buffer by default.
* **`:vsplit`** (or **`:vsp`**): Split the current window vertically. The new window will display the same buffer by default.
* **`:split {filename}`**: Split the current window horizontally and open `{filename}` in the new window.
* **`:vsplit {filename}`**: Split the current window vertically and open `{filename}` in the new window.

Let's practice splitting windows. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Type `:split` and press <Enter> to split the current window horizontally. You should see two windows displaying this buffer. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson3_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You split the window horizontally!",
                -- TODO: Add validation to check the number of windows or window layout.
            },
             {
                instruction = "Type `:vsplit` and press <Enter> to split the current window vertically. You should now have three windows. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson3_exercise2_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You split the window vertically!",
                 -- TODO: Add validation to check the number of windows or window layout.
            },
        },
    },
    lesson4 = {
        title = "Navigating Windows (`<C-w>`)",
        explanation = [[
Welcome to Lesson 12.4!

Once you have multiple windows open, you need to move between them. The `<C-w>` (Control + w) key is the prefix for window commands.

* **`<C-w> h`**: Move to the window on the left.
* **`<C-w> j`**: Move to the window below.
* **`<C-w> k`**: Move to the window above.
* **`<C-w> l`**: Move to the window on the right.
* **`<C-w> w`**: Cycle through windows (forward).
* **`<C-w> W`**: Cycle through windows (backward).
* **`<C-w> c`** (or **`:close`**): Close the current window. Note: This does *not* delete the buffer, just the view. If it's the last window on a buffer, the buffer might unload if not hidden.
* **`<C-w> q`** (or **`:quit`**): Close the current window. If it's the last window on a modified buffer, it will prompt you to save. If it's the last window in Vim, it exits Vim.

Let's practice navigating and closing windows. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Split the window horizontally (`:split`). Then use `<C-w> k` to move to the window above. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position (which implies window focus)
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson4_exercise1_setup.txt")),
                start_cursor = {5, 0},
                 -- After :split, cursor is usually in the bottom window.
                 -- After <C-w> k, cursor should be in the top window, at the same line/col.
                 -- We can't predict the exact line/col easily, but we can check if the window changed.
                 -- A simple check is to ensure they are back in Normal mode.
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You split and navigated windows!",
                 -- TODO: Add validation to check the active window ID.
            },
             {
                instruction = "Split the window vertically (`:vsplit`). Then use `<C-w> h` to move to the window on the left. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson4_exercise2_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You split and navigated windows!",
                 -- TODO: Add validation to check the active window ID.
            },
             {
                instruction = "Split the window horizontally (`:split`). Then use `:close` and press <Enter> to close the new window. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson4_exercise3_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You closed a window!",
                 -- TODO: Add validation to check the number of windows.
            },
        },
    },
    lesson5 = {
        title = "Working with Tabs (`:tabnew`, `:tabnext`, `:tabclose`)",
        explanation = [[
Welcome to Lesson 12.5!

Tab pages provide a way to have completely different window layouts. Each tab page is independent.

* **`:tabnew`**: Create a new tab page with a single window displaying an empty buffer.
* **`:tabnew {filename}`**: Create a new tab page and open `{filename}` in it.
* **`:tabnext`** (or **`gt`**): Go to the next tab page.
* **`:tabprev`** (or **`gT`**): Go to the previous tab page.
* **`{number}gt`**: Go to tab page number `{number}`.
* **`:tabclose`**: Close the current tab page. If it's the last tab page, it exits Vim.
* **`:tabonly`**: Close all other tab pages, leaving only the current one.

Let's practice working with tab pages. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Type `:tabnew` and press <Enter> to create a new tab page. You should see a new blank tab. Then type `:tabprev` and press <Enter> (or use `gT`) to return to the tutorial tab. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson5_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You created and navigated tabs!",
                 -- TODO: Add validation to check the active tab page number.
            },
             {
                instruction = "Type `:tabnew` and press <Enter> to create a new tab page. Then type `:tabclose` and press <Enter> to close that new tab and return to the tutorial. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson5_exercise2_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You created and closed a tab!",
                 -- TODO: Add validation to check the number of tab pages.
            },
        },
    },
    lesson6 = {
        title = "Combining Buffers, Windows, and Tabs",
        explanation = [[
Welcome to Lesson 12.6!

The real power comes from combining these concepts. You can yank text from one buffer, open a new window or tab page, switch to a different buffer (or create a new one), and paste the text.

Let's perform a sequence of actions that uses buffers, windows, and tabs together. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Yank the line 'YANK THIS LINE' using `yy`. Then type `:tabnew` to open a new tab. In the new tab, type `p` to paste the line. Then type `:tabclose` to close the new tab and return here. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content (should be unchanged)
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson6_exercise1_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on "YANK THIS LINE"
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module12_lesson6_exercise1_target.txt"))
                },
                feedback = "You successfully yanked, tabnew'd, pasted, and tabclosed!",
            },
             {
                instruction = "Yank the line 'YANK THIS LINE' using `yy`. Then type `:split` to open a new window. In the new window, type `:bnext` to switch to the tutorial text buffer. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module12_lesson6_exercise2_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on "YANK THIS LINE"
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You combined yanking, splitting, and buffer navigation!",
                 -- TODO: Add validation to check which buffer is displayed in the active window.
            },
        },
    },
    -- Add more lessons here if needed
    -- lesson7 = { ... }
}

