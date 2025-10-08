-- lua/learn_vim/modules/module4.lua

-- This file contains the content for Module 4: Essential Actions (Operators).
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')

return {
    title = "Essential Actions (Operators)",
    lesson1 = {
        title = "Deleting (`d`)",
        explanation = [[
Welcome to Module 4, Lesson 4.1!

Now that you know how to navigate efficiently, let's learn to modify text. One of the most fundamental actions is **deleting**.

The `d` key is the **delete operator**. It needs a **movement** (a "noun") to tell it *what* to delete.

Common combinations:
* `dw` - **d**elete **w**ord (from cursor to start of next word)
* `de` - **d**elete to **e**nd of word (from cursor to end of current word)
* `d$` - **d**elete to **end** of line (from cursor to end)
* `d0` - **d**elete to **start** of line (from cursor to beginning)
* `dd` - **d**elete **d**elete (a special case to delete the entire current line)

Like movements, operators can take a numerical prefix:
* `d3w` - Delete 3 words.
* `3dd` - Delete 3 lines.

Let's practice deleting text. Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Using `dw`, delete the word 'quick'. Then type `:LearnVim exc` to check.",
                type = "insert_text", -- Using insert_text type as we check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson1_exercise1_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on 'q' of 'quick'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson1_exercise1_target.txt")
                },
                feedback = "You deleted the word!",
            },
             {
                instruction = "Using `dd`, delete the line 'Delete this line.'. Then type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson1_exercise2_setup.txt"),
                start_cursor = {7, 0}, -- Cursor on the line to delete
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson1_exercise2_target.txt")
                },
                feedback = "You deleted the line!",
            },
             {
                instruction = "Using a count with `dw`, delete the next 3 words ('brown fox jumps'). Then type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson1_exercise3_setup.txt"),
                start_cursor = {6, 10}, -- Cursor on 'b' of 'brown'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson1_exercise3_target.txt")
                },
                feedback = "You deleted multiple words with a count!",
            },
             {
                instruction = "Using a count with `dd`, delete the next 2 lines (including the current one). Then type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson1_exercise4_setup.txt"),
                start_cursor = {7, 0}, -- Cursor on "Delete this line 1."
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson1_exercise4_target.txt")
                },
                feedback = "You deleted multiple lines with a count!",
            },
        },
    },
    lesson2 = {
        title = "Changing/Replacing (`c`, `r`, `R`)",
        explanation = [[
Welcome to Lesson 4.2!

Beyond just deleting, you often want to delete *and* immediately start typing new text. The **change operator** (`c`) does this.

The `c` operator also takes a movement:
* `cw` - **c**hange **w**ord (deletes the word and enters Insert mode)
* `ce` - **c**hange to **e**nd of word
* `c$` - **c**hange to **end** of line
* `cc` - **c**hange **c**hange (changes the entire current line)

Like `d`, `c` can use counts (e.g., `c3w` changes 3 words). After changing, you are in Insert mode; press `<Esc>` to return to Normal mode.

For replacing a single character, use the `r` command:
* `r{char}` - **r**eplace the character under the cursor with `{char}`. Does NOT enter Insert mode.

For replacing multiple characters, use **Replace mode** (`R`):
* `R` - Enter Replace mode. Typing overwrites existing characters until you press `<Esc>`.

Let's practice changing and replacing text. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Using `cw`, change the word 'quick' to 'slow'. Press `<Esc>` after typing. Then type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson2_exercise1_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on 'q' of 'quick'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson2_exercise1_target.txt")
                },
                feedback = "You changed the word!",
            },
             {
                instruction = "Using `cc`, change the line 'Change this line.' to 'This line is changed.'. Press `<Esc>` after typing. Then type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson2_exercise2_setup.txt"),
                start_cursor = {7, 0}, -- Cursor on the line to change
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson2_exercise2_target.txt")
                },
                feedback = "You changed the line!",
            },
             {
                instruction = "Using `r`, replace the character 'X' with 'Y'. Then type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson2_exercise3_setup.txt"),
                start_cursor = {6, 12}, -- Cursor on 'X'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson2_exercise3_target.txt")
                },
                feedback = "You replaced a single character!",
            },
             {
                instruction = "Using `R`, enter Replace mode and change 'overwriting' to 'replacing  '. Press `<Esc>` when done. Then type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson2_exercise4_setup.txt"),
                start_cursor = {6, 9}, -- Cursor on 'o' of 'overwriting'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson2_exercise4_target.txt")
                },
                feedback = "You used Replace mode!",
            },
        },
    },
    lesson3 = {
        title = "Copying and Pasting (`y`, `p`)",
        explanation = [[
Welcome to Lesson 4.3!

Copying and pasting (often called **yanking** and **putting** in Vim) is a common task.

The `y` key is the **yank operator** (copy). It also takes a movement:
* `yw` - **y**ank **w**ord
* `ye` - **y**ank to **e**nd of word
* `y$` - **y**ank to **end** of line
* `yy` - **y**ank **y**ank (yank the entire current line)

Yanked text is stored in a register (like a clipboard). The default register is the unnamed register.

The `p` key is the **put command** (paste).
* `p` - Paste the yanked/deleted text **after** the cursor.
* `P` - Paste the yanked/deleted text **before** the cursor.

Let's practice yanking and putting text. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Using `yw`, yank the word 'copy'. Then move to the line below and use `p` to paste it. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson3_exercise1_setup.txt"),
                start_cursor = {6, 0}, -- Cursor on 'C' of 'Copy'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson3_exercise1_target.txt")
                },
                feedback = "You copied and pasted a word!",
            },
             {
                instruction = "Using `yy`, yank the line 'Yank this line.'. Then move to the end of the line below 'Paste here:' and use `p` to paste it. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson3_exercise2_setup.txt"),
                start_cursor = {6, 0}, -- Cursor on the line to yank
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson3_exercise2_target.txt")
                },
                feedback = "You copied and pasted a line!",
            },
        },
    },
    lesson4 = {
        title = "Moving Text (Delete + Paste)",
        explanation = [[
Welcome to Lesson 4.4!

There isn't a single "move" command in Vim. Instead, moving text is typically done by **deleting** it (which also copies it to a register) and then **pasting** it elsewhere.

The `d` operator yanks the deleted text into the unnamed register, just like `y`.

Let's practice moving words and lines using this delete-then-paste pattern. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Move the word 'Move' from the first line to the end of the second line. Use `dw` and `p`. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson4_exercise1_setup.txt"),
                start_cursor = {6, 0}, -- Cursor on 'M' of 'Move'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson4_exercise1_target.txt")
                },
                feedback = "You moved the word!",
            },
             {
                instruction = "Move the line 'Move this line.' to below the line 'To here.'. Use `dd` and `p`. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson4_exercise2_setup.txt"),
                start_cursor = {7, 0}, -- Cursor on the line to move
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson4_exercise2_target.txt")
                },
                feedback = "You moved the line!",
            },
        },
    },
    lesson5 = {
        title = "Wrapping Lines (`gq`)",
        explanation = [[
Welcome to Lesson 4.5!

Sometimes you have long lines of text that you want to wrap to fit within a certain width (often controlled by the `textwidth` option). The `gq` operator is used for formatting or wrapping.

The `gq` operator also takes a movement or a text object:
* `gqap` - **g**o **q**uality (format) **a** **p**aragraph.
* `gqgq` or `gqq` - Format the **current** line.

Let's practice wrapping a paragraph. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Place your cursor anywhere in the paragraph below and type `gqap` to wrap it. Then type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson5_exercise1_setup.txt"),
                start_cursor = {6, 10}, -- Start somewhere in the middle of the paragraph
                -- NOTE: The target_content for wrapping is tricky as it depends on window width and 'textwidth'.
                -- We'll provide a plausible wrapped version, but users might need to adjust window size slightly.
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module4_lesson5_exercise1_target.txt")
                },
                feedback = "You wrapped the paragraph!",
            },
        },
    },
    -- Add more lessons for Module 4 here
    -- lesson6 = { ... }
}
