-- lua/learn_vim/modules/module7.lua

-- This file contains the content for Module 7: Finding, Searching, and Replacing.
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')

return {
    title = "Finding, Searching, and Replacing",
    lesson1 = {
        title = "Character Finding (`f`, `F`, `t`, `T`)",
        explanation = [[
Welcome to Module 7, Lesson 7.1!

Moving character by character or word by word is useful, but often you want to jump directly to a specific character on the current line.

In Normal mode:
* **`f{char}`**: Find the **next** occurrence of `{char}` on the current line and move the cursor **onto** it.
* **`F{char}`**: Find the **previous** occurrence of `{char}` on the current line and move the cursor **onto** it.
* **`t{char}`**: Find the **next** occurrence of `{char}` on the current line and move the cursor **just before** it.
* **`T{char}`**: Find the **previous** occurrence of `{char}` on the current line and move the cursor **just after** it.

After using `f`, `F`, `t`, or `T`, you can repeat the *same* find command on the same line:
* **`;`**: Repeat the last `f`, `F`, `t`, or `T` command in the **same direction**.
* **`,`**: Repeat the last `f`, `F`, `t`, or `T` command in the **opposite direction**.

Let's practice finding characters on a line. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Using `f`, jump to the first 'a' on the line below. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson1_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Start at the beginning of the line
                validation = { type = 'check_cursor_position', target_cursor = {5, 10} }, -- Target is the first 'a' in 'wizards'
                feedback = "You found the character!",
            },
             {
                instruction = "Using `t`, jump just before the 'f' in 'from'. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson1_exercise2_setup.txt"),
                start_cursor = {5, 0}, -- Start at the beginning
                validation = { type = 'check_cursor_position', target_cursor = {5, 24} }, -- Target is the space before 'f' in 'from'
                feedback = "You jumped just before the character!",
            },
             {
                instruction = "Using `f`, jump to the first 'i'. Then use `;` to jump to the next 'i'. Type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson1_exercise3_setup.txt"),
                start_cursor = {5, 0}, -- Start at the beginning
                validation = { type = 'check_cursor_position', target_cursor = {5, 8} }, -- Target is the 'i' in 'wizards' (second 'i')
                feedback = "You repeated the find forward!",
            },
             {
                instruction = "Using `f`, jump to the first 'i'. Then use `;` to jump to the next 'i'. Then use `,` to jump back to the previous 'i'. Type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson1_exercise4_setup.txt"),
                start_cursor = {5, 0}, -- Start at the beginning
                validation = { type = 'check_cursor_position', target_cursor = {5, 1} }, -- Target is the 'i' in 'Jinxed' (first 'i')
                feedback = "You repeated the find backward!",
            },
        },
    },
    lesson2 = {
        title = "Basic Searching (`/`, `?`)",
        explanation = [[
Welcome to Lesson 7.2!

To find text beyond the current line, you use **search**.

In Normal mode:
* **`/pattern<Enter>`**: Search **forward** for `pattern`.
* **`?pattern<Enter>`**: Search **backward** for `pattern`.

After a search, you can repeat it:
* **`n`**: Repeat the last search in the **same direction**.
* **`N`**: Repeat the last search in the **opposite direction**.

Let's practice searching. Type the search command and the pattern, press `<Enter>`, then use `:LearnVim exc` to check.
]],
        exercises = {
            {
                instruction = "Search forward for the word 'jumps' using `/`. Type `:LearnVim exc` to check after the search.",
                type = "cursor_move", -- Check cursor position after search
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson2_exercise1_setup.txt"),
                start_cursor = {6, 0}, -- Start at the beginning
                validation = { type = 'check_cursor_position', target_cursor = {7, 9} }, -- Target is the start of "jumps" on line 7
                feedback = "You found the word using search!",
            },
             {
                instruction = "Search backward for the word 'quick' using `?`. Type `:LearnVim exc` to check after the search.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson2_exercise2_setup.txt"),
                start_cursor = {6, 27}, -- Start at the end
                validation = { type = 'check_cursor_position', target_cursor = {6, 13} }, -- Target is the start of "quick" on line 6
                feedback = "You found the word using backward search!",
            },
             {
                instruction = "Search forward for 'Line'. Then use `n` to find the next 'Line'. Type `:LearnVim exc` to check.",
                type = "cursor_move",
                 setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson2_exercise3_setup.txt"),
                 start_cursor = {5, 0}, -- Start on blank line
                 validation = { type = 'check_cursor_position', target_cursor = {7, 1} }, -- Target is the start of "Line 2"
                 feedback = "You repeated the search forward!",
             },
        },
    },
    lesson3 = {
        title = "Combining Counts with Find/Search",
        explanation = [[
Welcome to Lesson 7.3!

Just like with movements, you can use a numerical prefix with find (`f`, `F`, `t`, `T`) and search (`/`, `?`) commands to jump to the Nth occurrence.

In Normal mode:
* **`{number}f{char}`**: Find the `{number}`th next occurrence of `{char}`.
* **`{number}/pattern<Enter>`**: Find the `{number}`th next occurrence of `pattern`.

And similarly for `F`, `t`, `T`, and `?`.

Let's practice using counts with find and search. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Using a numerical prefix with `f`, jump to the 3rd 'i' on the line below. Then type `:LearnVim exc` to check.",
                type = "cursor_move",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson3_exercise1_setup.txt"),
                start_cursor = {6, 0}, -- Start at the beginning
                validation = { type = 'check_cursor_position', target_cursor = {6, 22} }, -- Target is the 'i' in 'ivy' (1st in Jinxed, 2nd in wizards, 3rd in ivy)
                feedback = "You jumped to the 3rd 'i'!",
            },
             {
                instruction = "Using a numerical prefix with `/`, search forward for the 2nd occurrence of 'Line'. Type `:LearnVim exc` to check after the search.",
                type = "cursor_move",
                 setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson3_exercise2_setup.txt"),
                 start_cursor = {5, 0}, -- Start on blank line
                 validation = { type = 'check_cursor_position', target_cursor = {7, 1} }, -- Target is the start of "Line 2" (2nd occurrence)
                 feedback = "You found the 2nd occurrence using search and a count!",
             },
        },
    },
     lesson4 = {
        title = "Simple Find and Replace (`:s`)",
        explanation = [[
Welcome to Lesson 7.4!

Vim's command line is very powerful for find and replace operations using the `:s` command (substitute). The basic format is:

`:s/pattern/replace/flags`

* `pattern`: The text to search for.
* `replace`: The text to replace it with.
* `flags`: Optional modifiers (e.g., `g` for global on the line, `c` for confirmation).

By default, `:s` only affects the *first* occurrence on the current line. To replace *all* occurrences on the current line, add the `g` flag: `:s/pattern/replace/g`.

To perform the substitution on a range of lines, specify the range before `:s`. For example, `:%s/pattern/replace/g` replaces all occurrences in the entire file (`%` means the whole file).

Let's practice a simple find and replace on the current line. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Using `:s`, replace the first occurrence of 'old' with 'new' on the line below. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson4_exercise1_setup.txt"),
                start_cursor = {6, 0},
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson4_exercise1_target.txt")
                },
                feedback = "You performed a simple substitution!",
            },
             {
                instruction = "Using `:s` with the `g` flag, replace all occurrences of 'old' with 'new' on the line below. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson4_exercise2_setup.txt"),
                start_cursor = {5, 0},
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module7_lesson4_exercise2_target.txt")
                },
                feedback = "You performed a global substitution on the line!",
            },
        },
    },
    -- Add more lessons for Module 7 here (e.g., ranges with :s, confirmation flag, more complex patterns)
    -- lesson5 = { ... }
}

