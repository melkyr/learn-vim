-- lua/learn_vim/modules/module13.lua
-- lua/learn_vim/locales/en/modules/module13.lua

-- This file contains the content for Module 13: Text Objects.
-- It covers operating on logical blocks of text using text objects.

local Utils = require('learn_vim.utils')
local Locale = require('learn_vim.locale')
local lang = Locale.get_language()

local function get_exercise_path(filename)
    return "lua/learn_vim/locales/" .. lang .. "/exercise_content/" .. filename
end

return {
    title = "Text Objects",
    lesson1 = {
        title = "Introduction to Text Objects (`i`, `a`)",
        explanation = [[
Welcome to Module 13, Lesson 13.1!

Text objects are a powerful way to select or operate on logical blocks of text, such as words, sentences, paragraphs, or content within delimiters (like parentheses or quotes).

A text object command consists of two characters:
1.  An "inner" or "around" indicator:
    * `i`: Inner object (selects the content *inside* delimiters or the word itself, excluding surrounding whitespace/delimiters).
    * `a`: Around object (selects the content *and* the surrounding whitespace/delimiters).
2.  The object itself (e.g., `w` for word, `s` for sentence, `p` for paragraph, `)` or `}` or `]` or `"` or `'` or ``` for delimiters).

You combine a text object with an operator (like `d`, `c`, `y`, `v`). For example:
* `diw`: Delete **i**nner **w**ord.
* `cas`: Change **a**round **s**entence.
* `yip`: Yank **i**nner **p**aragraph.
* `va"`: **V**isually select **a**round double quotes.

Let's start with the basic word text objects. Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this Python snippet, place your cursor anywhere on the word 'example' and use `diw` to delete the inner word. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson1_exercise1_setup.txt")),
                start_cursor = {5, 20}, -- Cursor on 'p' of 'example'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson1_exercise1_target.txt"))
                },
                feedback = "You deleted the inner word!",
            },
             {
                instruction = "In this HTML snippet, place your cursor anywhere on the word 'Item' in the first list item and use `daw` to delete around the word. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson1_exercise2_setup.txt")),
                start_cursor = {6, 9}, -- Cursor on 't' of 'Item'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson1_exercise2_target.txt"))
                },
                feedback = "You deleted around the word!",
            },
        },
    },
    lesson2 = {
        title = "Sentence and Paragraph Objects (`s`, `p`)",
        explanation = [[
Welcome to Lesson 13.2!

Beyond words, you can operate on larger blocks like sentences and paragraphs.

* `is`: Inner sentence.
* `as`: Around sentence.
* `ip`: Inner paragraph.
* `ap`: Around paragraph.

Vim determines sentences based on punctuation (`.`, `!`, `?`) followed by whitespace or newline. Paragraphs are typically separated by blank lines.

Let's practice with sentences and paragraphs. Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this text snippet, place your cursor anywhere on the first sentence and use `cis` to change the inner sentence. Type 'This is the new first sentence.' and press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson2_exercise1_setup.txt")),
                start_cursor = {5, 10}, -- Cursor on 'h' of 'the'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson2_exercise1_target.txt"))
                },
                feedback = "You changed the inner sentence!",
            },
             {
                instruction = "In this text snippet, place your cursor anywhere on the first paragraph and use `dap` to delete around the paragraph. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson2_exercise2_setup.txt")),
                start_cursor = {5, 5}, -- Cursor on 's' of 'This'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson2_exercise2_target.txt"))
                },
                feedback = "You deleted around the paragraph!",
            },
        },
    },
    lesson3 = {
        title = "Delimiter Objects (`()`, `[]`, `{}` etc.)",
        explanation = [[
Welcome to Lesson 13.3!

Text objects are incredibly useful for working with code by targeting content within pairs of delimiters.

* `i)` or `i(`: Inner parentheses.
* `a)` or `a(`: Around parentheses.
* `i]` or `i[`: Inner square brackets.
* `a]` or `a[`: Around square brackets.
* `i}` or `i{`: Inner curly braces.
* `a}` or `a{`: Around curly braces.
* `i"`: Inner double quotes.
* `a"`: Around double quotes.
* `i'`: Inner single quotes.
* `a'`: Around single quotes.
* `i``: Inner backticks.
* `a``: Around backticks.

Place your cursor *anywhere* within or on the delimiters to use these.

Let's practice with delimiter text objects in different languages. Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this JavaScript snippet, place your cursor anywhere inside the parentheses `()` of the `console.log` call and use `ci(` to change the inner parentheses. Type `'Hello, World!'` and press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson3_exercise1_setup.txt")),
                start_cursor = {6, 20}, -- Cursor on 'O' of 'Original'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson3_exercise1_target.txt"))
                },
                feedback = "You changed text inside parentheses!",
            },
             {
                instruction = "In this Go snippet, place your cursor anywhere inside the curly braces `{}` of the slice literal and use `da{` to delete around the curly braces. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson3_exercise2_setup.txt")),
                start_cursor = {7, 22}, -- Cursor on '2'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson3_exercise2_target.txt"))
                },
                feedback = "You deleted around curly braces!",
            },
             {
                instruction = "In this Python snippet, place your cursor anywhere inside the single quotes `''` and use `ya'` to yank the inner single quotes. Then move to the line below and paste using `p`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson3_exercise3_setup.txt")),
                start_cursor = {5, 16}, -- Cursor on 't' of 'this'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson3_exercise3_target.txt"))
                },
                feedback = "You yanked text inside single quotes!",
            },
        },
    },
    lesson4 = {
        title = "Combining Operators with Text Objects",
        explanation = [[
Welcome to Lesson 13.4!

The true power of text objects comes from combining them with operators and Visual mode.

* **Operator + Text Object**: Performs the operation on the text object (e.g., `dip`, `ca"`, `yis`).
* **`v` + Text Object**: Selects the text object in Visual mode (e.g., `vip`, `va"`, `vis`). Once selected, you can apply any operator or continue refining the selection.

Let's practice combining operators and Visual mode with text objects. Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this C++ snippet, place your cursor anywhere inside the curly braces `{}` of the function body and use `va{` to visually select around the curly braces. Then press `d` to delete the selection. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson4_exercise1_setup.txt")),
                start_cursor = {7, 8}, -- Cursor inside the curly braces
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson4_exercise1_target.txt"))
                },
                feedback = "You visually selected and deleted around curly braces!",
            },
             {
                instruction = "In this SQL snippet, place your cursor anywhere inside the parentheses `()` after `VALUES` and use `ci(` to change the inner parentheses. Type `1, 'Test User'` and press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson4_exercise2_setup.txt")),
                start_cursor = {5, 38}, -- Cursor inside the VALUES parentheses
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson4_exercise2_target.txt"))
                },
                feedback = "You changed text inside parentheses!",
            },
             {
                instruction = [["In this Ruby snippet, place your cursor anywhere inside the double quotes `""` and use yi`"` to yank the inner double quotes. Then move to the line below and paste using `p`. Type `:LearnVim exc` to check."]],
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content(get_exercise_path("module13_lesson4_exercise3_setup.txt")),
                start_cursor = {5, 10}, -- Cursor inside the double quotes
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content(get_exercise_path("module13_lesson4_exercise3_target.txt"))
                },
                feedback = "You yanked text inside double quotes!",
            },
        },
    },
    -- Add more lessons here if needed
    -- lesson5 = { ... }
}
