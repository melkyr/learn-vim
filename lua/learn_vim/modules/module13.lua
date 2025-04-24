-- lua/learn_vim/modules/module13.lua

-- This file contains the content for Module 13: Text Objects.
-- It covers operating on logical blocks of text using text objects.

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
                setup_text = [[
" --- Exercise 13.1.1 (Python) ---
" Instruction: In this Python snippet, place your cursor anywhere on the word 'example' and use `diw` to delete the inner word. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
my_variable = "This is an example sentence."]],
                start_cursor = {5, 20}, -- Cursor on 'p' of 'example'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.1.1 (Python) ---
" Instruction: In this Python snippet, place your cursor anywhere on the word 'example' and use `diw` to delete the inner word. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
my_variable = "This is an  sentence."]] -- 'example' deleted, space remains
                },
                feedback = "You deleted the inner word!",
            },
             {
                instruction = "In this HTML snippet, place your cursor anywhere on the word 'Item' in the first list item and use `daw` to delete around the word. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 13.1.2 (HTML) ---
" Instruction: In this HTML snippet, place your cursor anywhere on the word 'Item' in the first list item and use `daw` to delete around the word. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<ul>
    <li>Item 1</li>
    <li>Item 2</li>
</ul>]],
                start_cursor = {6, 9}, -- Cursor on 't' of 'Item'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.1.2 (HTML) ---
" Instruction: In this HTML snippet, place your cursor anywhere on the word 'Item' in the first list item and use `daw` to delete around the word. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<ul>
    <li>1</li>
    <li>Item 2</li>
</ul>]] -- 'Item' and the following space deleted
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
                setup_text = [[
" --- Exercise 13.2.1 ---
" Instruction: In this text snippet, place your cursor anywhere on the first sentence and use `cis` to change the inner sentence. Type 'This is the new first sentence.' and press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
This is the first sentence. This is the second sentence.

This is a separate paragraph.]],
                start_cursor = {5, 10}, -- Cursor on 'h' of 'the'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.2.1 ---
" Instruction: In this text snippet, place your cursor anywhere on the first sentence and use `cis` to change the inner sentence. Type 'This is the new first sentence.' and press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
This is the new first sentence. This is the second sentence.

This is a separate paragraph.]] -- First sentence changed
                },
                feedback = "You changed the inner sentence!",
            },
             {
                instruction = "In this text snippet, place your cursor anywhere on the first paragraph and use `dap` to delete around the paragraph. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 13.2.2 ---
" Instruction: In this text snippet, place your cursor anywhere on the first paragraph and use `dap` to delete around the paragraph. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
This is the first paragraph.
It has multiple lines.

This is the second paragraph.]],
                start_cursor = {5, 5}, -- Cursor on 's' of 'This'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.2.2 ---
" Instruction: In this text snippet, place your cursor anywhere on the first paragraph and use `dap` to delete around the paragraph. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

This is the second paragraph.]] -- First paragraph and the blank line after it deleted
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
                setup_text = [[
" --- Exercise 13.3.1 (JavaScript) ---
" Instruction: In this JavaScript snippet, place your cursor anywhere inside the parentheses `()` of the `console.log` call and use `ci(` to change the inner parentheses. Type `'Hello, World!'` and press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
function greet() {
    console.log("Original message");
}]],
                start_cursor = {6, 20}, -- Cursor on 'O' of 'Original'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.3.1 (JavaScript) ---
" Instruction: In this JavaScript snippet, place your cursor anywhere inside the parentheses `()` of the `console.log` call and use `ci(` to change the inner parentheses. Type `'Hello, World!'` and press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
function greet() {
    console.log('Hello, World!');
}]], -- Content inside () changed
                },
                feedback = "You changed text inside parentheses!",
            },
             {
                instruction = "In this Go snippet, place your cursor anywhere inside the curly braces `{}` of the slice literal and use `da{` to delete around the curly braces. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 13.3.2 (Go) ---
" Instruction: In this Go snippet, place your cursor anywhere inside the curly braces `{}` of the slice literal and use `da{` to delete around the curly braces. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
package main

func main() {
    numbers := []int{1, 2, 3}
    // Keep this line
}]],
                start_cursor = {7, 22}, -- Cursor on '2'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.3.2 (Go) ---
" Instruction: In this Go snippet, place your cursor anywhere inside the curly braces `{}` of the slice literal and use `da{` to delete around the curly braces. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
package main

func main() {
    numbers := []int
    // Keep this line
}]], -- The {1, 2, 3} and surrounding space deleted
                },
                feedback = "You deleted around curly braces!",
            },
             {
                instruction = "In this Python snippet, place your cursor anywhere inside the single quotes `''` and use `ya'` to yank the inner single quotes. Then move to the line below and paste using `p`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 13.3.3 (Python) ---
" Instruction: In this Python snippet, place your cursor anywhere inside the single quotes `''` and use `ya'` to yank the inner single quotes. Then move to the line below and paste using `p`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
my_string = 'Yank this content'
Paste here:]],
                start_cursor = {5, 16}, -- Cursor on 't' of 'this'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.3.3 (Python) ---
" Instruction: In this Python snippet, place your cursor anywhere inside the single quotes `''` and use `ya'` to yank the inner single quotes. Then move to the line below and paste using `p`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
my_string = 'Yank this content'
Paste here:Yank this content]] -- 'Yank this content' pasted
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
                instruction = "In this C++ snippet, place your cursor anywhere inside the curly braces `{}` of the function body and use `vaf{` to visually select around the curly braces. Then press `d` to delete the selection. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 13.4.1 (C++) ---
" Instruction: In this C++ snippet, place your cursor anywhere inside the curly braces `{}` of the function body and use `va{` to visually select around the curly braces. Then press `d` to delete the selection. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <iostream>

int main() {
    std::cout << "Hello, world!" << std::endl;
    return 0;
}
]],
                start_cursor = {7, 8}, -- Cursor inside the curly braces
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.4.1 (C++) ---
" Instruction: In this C++ snippet, place your cursor anywhere inside the curly braces `{}` of the function body and use `va{` to visually select around the curly braces. Then press `d` to delete the selection. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <iostream>

int main()
]], -- The curly braces and content deleted
                },
                feedback = "You visually selected and deleted around curly braces!",
            },
             {
                instruction = "In this SQL snippet, place your cursor anywhere inside the parentheses `()` after `VALUES` and use `ci(` to change the inner parentheses. Type `1, 'Test User'` and press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 13.4.2 (SQL) ---
" Instruction: In this SQL snippet, place your cursor anywhere inside the parentheses `()` after `VALUES` and use `ci(` to change the inner parentheses. Type `1, 'Test User'` and press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
INSERT INTO users (id, name) VALUES ('abc', 'def');]],
                start_cursor = {5, 38}, -- Cursor inside the VALUES parentheses
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.4.2 (SQL) ---
" Instruction: In this SQL snippet, place your cursor anywhere inside the parentheses `()` after `VALUES` and use `ci(` to change the inner parentheses. Type `1, 'Test User'` and press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
INSERT INTO users (id, name) VALUES (1, 'Test User');]] -- Content inside () changed
                },
                feedback = "You changed text inside parentheses!",
            },
             {
                instruction = "In this Ruby snippet, place your cursor anywhere inside the double quotes `\"\"` and use `yi\"` to yank the inner double quotes. Then move to the line below and paste using `p`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 13.4.3 (Ruby) ---
" Instruction: In this Ruby snippet, place your cursor anywhere inside the double quotes `\"\"` and use `yi\"` to yank the inner double quotes. Then move to the line below and paste using `p`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
puts \"Yank this string\"
# Paste here:]],
                start_cursor = {5, 10}, -- Cursor inside the double quotes
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 13.4.3 (Ruby) ---
" Instruction: In this Ruby snippet, place your cursor anywhere inside the double quotes `\"\"` and use `yi\"` to yank the inner double quotes. Then move to the line below and paste using `p`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
puts \"Yank this string\"
# Paste here:Yank this string]] -- 'Yank this string' pasted
                },
                feedback = "You yanked text inside double quotes!",
            },
        },
    },
    -- Add more lessons here if needed
    -- lesson5 = { ... }
}

