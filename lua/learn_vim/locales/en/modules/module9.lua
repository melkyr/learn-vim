-- lua/learn_vim/modules/module9.lua
-- lua/learn_vim/locales/en/modules/module9.lua

-- This file contains the content for Module 9: Advanced Editing and Navigation.
-- It covers multiline editing, repetition with multiline actions, and '%' navigation.
-- It uses examples from various programming languages.

local Utils = require('learn_vim.utils')
local Locale = require('learn_vim.locale')
local lang = Locale.get_language()

local function get_exercise_path(filename)
    return "lua/learn_vim/locales/" .. lang .. "/exercise_content/" .. filename
end

return {
    title = "Advanced Editing and Navigation",
    lesson1 = {
        title = "Multiline Visual Editing",
        explanation = [[
Welcome to Module 9, Lesson 9.1!

Visual mode (`v`, `V`, `<C-v>`) is very powerful for applying actions to multiple lines or blocks of text. You select the text visually, and then press an operator (like `d` or `c`).

* **Line Visual (`V`)** is ideal for selecting whole lines to delete, yank, or change.
* **Block Visual (`<C-v>`)** is perfect for inserting or deleting text in a vertical column.

Let's practice multiline editing using Visual mode in different languages. Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Using Line Visual (`V`) and `d`, delete the three lines of the Python function body. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson1_exercise1_setup.txt")),
                start_cursor = {6, 4}, -- Cursor on the first line of the body
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson1_exercise1_target.txt"))
                },
                feedback = "You deleted multiple lines using Line Visual!",
            },
             {
                instruction = "Using Block Visual (`<C-v>`) and `x`, delete the leading spaces on the three list items in this HTML snippet. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson1_exercise2_setup.txt")),
                start_cursor = {6, 0}, -- Cursor on the first space of the first <li>
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson1_exercise2_target.txt"))
                },
                feedback = "You deleted a column using Block Visual!",
            },
             {
                instruction = "Using Block Visual (`<C-v>`) and `I`, insert '// ' at the beginning of the three lines in this JavaScript snippet to comment them out. Type the text, press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson1_exercise3_setup.txt")),
                start_cursor = {6, 4}, -- Cursor on 'l' of 'let'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson1_exercise3_target.txt"))
                },
                feedback = "You commented out lines using Block Visual and Insert!",
            },
        },
    },
    lesson2 = {
        title = "Repeating Multiline Actions",
        explanation = [[
Welcome to Lesson 9.2!

The `.` (dot) command repeats the last *change*. This includes changes made using Visual mode or operators on multiple lines.

If you delete 3 lines with `3dd` or `Vjjjd`, the `.` command will repeat that entire 3-line deletion from the current cursor position. If you use Block Visual to insert text on multiple lines, `.` will repeat that block insertion.

Let's practice repeating multiline actions. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Delete the first block of 3 lines using `3dd`. Then move to the start of the second block and use `.` to delete it. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson2_exercise1_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on "Block 1 Line 1"
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson2_exercise1_target.txt"))
                },
                feedback = "You repeated a multiline deletion!",
            },
             {
                instruction = "Using Block Visual (`<C-v>`) and `I`, insert 'Prefix: ' at the start of the first two lines. Type the text, press `<Esc>`. Then move to the next two lines and use `.` to repeat the block insertion. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson2_exercise2_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on "Line A1"
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson2_exercise2_target.txt"))
                },
                feedback = "You repeated a block insertion!",
            },
        },
    },
    lesson3 = {
        title = "Matching Braces/Brackets/Parentheses (`%`)",
        explanation = [[
Welcome to Lesson 9.3!

When working with code, you often need to jump between matching pairs of delimiters like parentheses `()`, square brackets `[]`, and curly braces `{}`. The `%` command does this.

In Normal mode, place your cursor on an opening or closing delimiter and press `%`. Vim will jump to its matching pair.

This works across lines and is invaluable for navigating code structure.

Let's practice using `%` in different languages. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this JavaScript snippet, place your cursor on the opening curly brace `{` and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson3_exercise1_setup.txt")),
                start_cursor = {5, 23}, -- Cursor on the first '{'
                validation = { type = 'check_cursor_position', target_cursor = {10, 0} }, -- Target is the final '}'
                feedback = "You jumped to the matching curly brace!",
            },
             {
                instruction = "In this Racket snippet, place your cursor on the opening parenthesis `(` on the first line and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson3_exercise2_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on the first '('
                validation = { type = 'check_cursor_position', target_cursor = {8, 30} }, -- Target is the final ')'
                feedback = "You jumped to the matching parenthesis!",
            },
             {
                instruction = "In this Go snippet, place your cursor on the opening square bracket `[` and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson3_exercise3_setup.txt")),
                start_cursor = {8, 14}, -- Cursor on the '['
                validation = { type = 'check_cursor_position', target_cursor = {8, 12} }, -- Target is the ']' of the '[]int' pair
                feedback = "You jumped to the matching square bracket!",
            },
        },
    },
    lesson4 = {
        title = "Applying Actions with `%`",
        explanation = [[
Welcome to Lesson 9.4!

The `%` command is not just for navigation; it's also a **movement** that can be combined with operators!

For example:
* `d%` - Delete from the current cursor position to the matching delimiter.
* `c%` - Change from the current cursor position to the matching delimiter (deletes and enters Insert mode).
* `y%` - Yank from the current cursor position to the matching delimiter.

This is incredibly useful for deleting or changing the content within parentheses, brackets, or braces quickly.

Let's practice combining operators with `%`. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this Dart snippet, place your cursor on the opening parenthesis `(` and use `d%` to delete everything between the parentheses (including the parentheses themselves). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson4_exercise1_setup.txt")),
                start_cursor = {6, 8}, -- Cursor on the '('
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson4_exercise1_target.txt"))
                },
                feedback = "You deleted content within parentheses!",
            },
             {
                instruction = "In this SQL snippet, place your cursor on the opening parenthesis `(` after `VALUES` and use `c%` to change the values inside. Type `1, 2, 3` and press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson4_exercise2_setup.txt")),
                start_cursor = {5, 34}, -- Cursor on the '(' after VALUES
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson4_exercise2_target.txt"))
                },
                feedback = "You changed content within parentheses!",
            },
             {
                instruction = "In this Java snippet, place your cursor on the opening curly brace `{` of the `if` statement and use `y%` to yank the content inside (including the braces). Then move to the line below the `else` block and paste it using `p`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson4_exercise3_setup.txt")),
                start_cursor = {7, 24}, -- Cursor on the '{' of the if statement
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson4_exercise3_target.txt"))
                },
                feedback = "You yanked and pasted content using %!",
            },
        },
    },
     lesson5 = {
        title = "More Languages, More Practice",
        explanation = [[
Welcome to Lesson 9.5!

Let's continue practicing multiline editing and '%' navigation with snippets from a wider variety of languages. The principles you've learned apply consistently across different file types in Vim.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this Lua snippet, use Line Visual (`V`) to select the lines inside the `if` block and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise1_setup.txt")),
                start_cursor = {6, 2}, -- Cursor on 'p' of 'print'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise1_target.txt"))
                },
                feedback = "You deleted lines in a Lua snippet!",
            },
             {
                instruction = "In this Go snippet, use Block Visual (`<C-v>`) to delete the type declaration (`int`) from the slice definition. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise2_setup.txt")),
                start_cursor = {8, 17}, -- Cursor on 'i' of 'int'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise2_target.txt"))
                },
                feedback = "You deleted a type declaration using Block Visual!",
            },
             {
                instruction = "In this Dart snippet, place your cursor on the opening parenthesis `(` of the `print` call and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise3_setup.txt")),
                start_cursor = {6, 8}, -- Cursor on the '(' after print
                validation = { type = 'check_cursor_position', target_cursor = {6, 23} }, -- Target is the closing ')'
                feedback = "You jumped to the matching parenthesis in Dart!",
            },
             {
                instruction = "In this SQL snippet, use Line Visual (`V`) to select the `FROM` and `WHERE` clauses and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise4_setup.txt")),
                start_cursor = {6, 0}, -- Cursor on 'F' of FROM
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise4_target.txt"))
                },
                feedback = "You deleted SQL clauses using Line Visual!",
            },
             {
                instruction = "In this Rust snippet, place your cursor on the opening curly brace `{` of the `main` function and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise5_setup.txt")),
                start_cursor = {5, 10}, -- Cursor on the '{'
                validation = { type = 'check_cursor_position', target_cursor = {7, 0} }, -- Target is the closing '}'
                feedback = "You jumped to the matching curly brace in Rust!",
            },
             {
                instruction = "In this Swift snippet, use Line Visual (`V`) to select the two lines inside the `struct` and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise6_setup.txt")),
                start_cursor = {6, 4}, -- Cursor on 'v' of var name
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise6_target.txt"))
                },
                feedback = "You deleted lines in a Swift snippet!",
            },
             {
                instruction = "In this Ruby snippet, place your cursor on the opening parenthesis `(` and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise7_setup.txt")),
                start_cursor = {5, 9}, -- Cursor on the '('
                validation = { type = 'check_cursor_position', target_cursor = {5, 14} }, -- Target is the closing ')'
                feedback = "You jumped to the matching parenthesis in Ruby!",
            },
             {
                instruction = "In this PHP snippet, use Block Visual (`<C-v>`) to delete the '$' character at the start of the variables in the function. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise8_setup.txt")),
                start_cursor = {7, 4}, -- Cursor on the '$' of $sum
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise8_target.txt"))
                },
                feedback = "You deleted '$' characters using Block Visual!",
            },
             {
                instruction = "In this C++ snippet, place your cursor on the opening curly brace `{` of the `main` function and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise9_setup.txt")),
                start_cursor = {6, 14}, -- Cursor on the '{'
                validation = { type = 'check_cursor_position', target_cursor = {9, 0} }, -- Target is the closing '}'
                feedback = "You jumped to the matching curly brace in C++!",
            },
             {
                instruction = "In this C# snippet, use Line Visual (`V`) to select the two lines inside the `if` block and yank them (`y`). Then move to the line below the `else` block and paste them (`p`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise10_setup.txt")),
                start_cursor = {8, 12}, -- Cursor on 'C' of Console.WriteLine("Hello")
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise10_target.txt"))
                },
                feedback = "You yanked and pasted lines in a C# snippet!",
            },
             {
                instruction = "In this Kotlin snippet, place your cursor on the opening parenthesis `(` of the `println` call and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise11_setup.txt")),
                start_cursor = {6, 11}, -- Cursor on the '(' after println
                validation = { type = 'check_cursor_position', target_cursor = {6, 28} }, -- Target is the closing ')'
                feedback = "You jumped to the matching parenthesis in Kotlin!",
            },
             {
                instruction = "In this Shell Script snippet, use Block Visual (`<C-v>`) to delete the leading '#' characters used for comments. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise12_setup.txt")),
                start_cursor = {5, 0}, -- Cursor on the '#' of the first line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module9_lesson5_exercise12_target.txt"))
                },
                feedback = "You deleted comment characters using Block Visual!",
            },
        },
    },
    -- Add more lessons for Module 9 here if needed
    -- lesson6 = { ... }
}

