-- lua/learn_vim/modules/module9.lua

-- This file contains the content for Module 9: Advanced Editing and Navigation.
-- It covers multiline editing, repetition with multiline actions, and '%' navigation.
-- It uses examples from various programming languages.

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
                setup_text = [[
" --- Exercise 9.1.1 (Python) ---
" Instruction: Using Line Visual (`V`) and `d`, delete the three lines of the Python function body. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
def my_function():
    # This is line 1
    # This is line 2
    # This is line 3
    pass # Keep this line]],
                start_cursor = {6, 4}, -- Cursor on the first line of the body
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.1.1 (Python) ---
" Instruction: Using Line Visual (`V`) and `d`, delete the three lines of the Python function body. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
def my_function():
    pass # Keep this line]]
                },
                feedback = "You deleted multiple lines using Line Visual!",
            },
             {
                instruction = "Using Block Visual (`<C-v>`) and `x`, delete the leading spaces on the three list items in this HTML snippet. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.1.2 (HTML) ---
" Instruction: Using Block Visual (`<C-v>`) and `x`, delete the leading spaces on the three list items in this HTML snippet. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<ul>
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
</ul>]],
                start_cursor = {6, 0}, -- Cursor on the first space of the first <li>
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.1.2 (HTML) ---
" Instruction: Using Block Visual (`<C-v>`) and `x`, delete the leading spaces on the three list items in this HTML snippet. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<ul>
<li>Item 1</li>
<li>Item 2</li>
<li>Item 3</li>
</ul>]]
                },
                feedback = "You deleted a column using Block Visual!",
            },
             {
                instruction = "Using Block Visual (`<C-v>`) and `I`, insert '// ' at the beginning of the three lines in this JavaScript snippet to comment them out. Type the text, press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.1.3 (JavaScript) ---
" Instruction: Using Block Visual (`<C-v>`) and `I`, insert '// ' at the beginning of the three lines in this JavaScript snippet to comment them out. Type the text, press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
function greet() {
    let name = "World";
    console.log("Hello, " + name);
}
greet();]],
                start_cursor = {6, 4}, -- Cursor on 'l' of 'let'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.1.3 (JavaScript) ---
" Instruction: Using Block Visual (`<C-v>`) and `I`, insert '// ' at the beginning of the three lines in this JavaScript snippet to comment them out. Type the text, press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
function greet() {
    // let name = "World";
    // console.log("Hello, " + name);
}
greet();]]
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
                setup_text = [[
" --- Exercise 9.2.1 ---
" Instruction: Delete the first block of 3 lines using `3dd`. Then move to the start of the second block and use `.` to delete it. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Block 1 Line 1
Block 1 Line 2
Block 1 Line 3
Keep this line.
Block 2 Line 1
Block 2 Line 2
Block 2 Line 3
Keep this line too.]],
                start_cursor = {5, 0}, -- Cursor on "Block 1 Line 1"
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.2.1 ---
" Instruction: Delete the first block of 3 lines using `3dd`. Then move to the start of the second block and use `.` to delete it. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Keep this line.
Keep this line too.]] -- Both blocks of 3 lines should be gone
                },
                feedback = "You repeated a multiline deletion!",
            },
             {
                instruction = "Using Block Visual (`<C-v>`) and `I`, insert 'Prefix: ' at the start of the first two lines. Type the text, press `<Esc>`. Then move to the next two lines and use `.` to repeat the block insertion. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.2.2 ---
" Instruction: Using Block Visual (`<C-v>`) and `I`, insert 'Prefix: ' at the start of the first two lines. Type the text, press `<Esc>`. Then move to the next two lines and use `.` to repeat the block insertion. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Line A1
Line A2
Line B1
Line B2
Line C1
Line C2]],
                start_cursor = {5, 0}, -- Cursor on "Line A1"
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.2.2 ---
" Instruction: Using Block Visual (`<C-v>`) and `I`, insert 'Prefix: ' at the start of the first two lines. Type the text, press `<Esc>`. Then move to the next two lines and use `.` to repeat the block insertion. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
Prefix: Line A1
Prefix: Line A2
Prefix: Line B1
Prefix: Line B2
Line C1
Line C2]] -- Prefix added to first four lines
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
                setup_text = [[
" --- Exercise 9.3.1 (JavaScript) ---
" Instruction: In this JavaScript snippet, place your cursor on the opening curly brace `{` and press `%`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
function calculate(a, b) {
    if (a > b) {
        return a - b;
    } else {
        return b - a;
    }
}]],
                start_cursor = {5, 23}, -- Cursor on the first '{'
                validation = { type = 'check_cursor_position', target_cursor = {10, 1} }, -- Target is the final '}'
                feedback = "You jumped to the matching curly brace!",
            },
             {
                instruction = "In this Racket snippet, place your cursor on the opening parenthesis `(` on the first line and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = [[
" --- Exercise 9.3.2 (Racket) ---
" Instruction: In this Racket snippet, place your cursor on the opening parenthesis `(` on the first line and press `%`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))]],
                start_cursor = {5, 0}, -- Cursor on the first '('
                validation = { type = 'check_cursor_position', target_cursor = {8, 27} }, -- Target is the final ')'
                feedback = "You jumped to the matching parenthesis!",
            },
             {
                instruction = "In this Go snippet, place your cursor on the opening square bracket `[` and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = [[
" --- Exercise 9.3.3 (Go) ---
" Instruction: In this Go snippet, place your cursor on the opening square bracket `[` and press `%`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
package main

import "fmt"

func main() {
    numbers := []int{1, 2, 3, 4, 5}
    fmt.Println(numbers[2]) // Access the third element
}]],
                start_cursor = {8, 14}, -- Cursor on the '['
                validation = { type = 'check_cursor_position', target_cursor = {8, 24} }, -- Target is the ']'
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
                setup_text = [[
" --- Exercise 9.4.1 (Dart) ---
" Instruction: In this Dart snippet, place your cursor on the opening parenthesis `(` and use `d%` to delete everything between the parentheses (including the parentheses themselves). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
void printMessage(String message) {
  print(message);
}]],
                start_cursor = {6, 8}, -- Cursor on the '('
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.4.1 (Dart) ---
" Instruction: In this Dart snippet, place your cursor on the opening parenthesis `(` and use `d%` to delete everything between the parentheses (including the parentheses themselves). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
void printMessage(String message) {
  print;
}]], -- The parentheses and 'message' inside should be gone
                },
                feedback = "You deleted content within parentheses!",
            },
             {
                instruction = "In this SQL snippet, place your cursor on the opening parenthesis `(` after `VALUES` and use `c%` to change the values inside. Type `1, 2, 3` and press `<Esc>`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.4.2 (SQL) ---
" Instruction: In this SQL snippet, place your cursor on the opening parenthesis `(` after `VALUES` and use `c%` to change the values inside. Type `1, 2, 3` and press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
INSERT INTO users (id, name) VALUES ('abc', 'def');]],
                start_cursor = {5, 34}, -- Cursor on the '(' after VALUES
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.4.2 (SQL) ---
" Instruction: In this SQL snippet, place your cursor on the opening parenthesis `(` after `VALUES` and use `c%` to change the values inside. Type `1, 2, 3` and press `<Esc>`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
INSERT INTO users (id, name) VALUES (1, 2, 3);]] -- The original values changed to 1, 2, 3
                },
                feedback = "You changed content within parentheses!",
            },
             {
                instruction = "In this Java snippet, place your cursor on the opening curly brace `{` of the `if` statement and use `y%` to yank the content inside (including the braces). Then move to the line below the `else` block and paste it using `p`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.4.3 (Java) ---
" Instruction: In this Java snippet, place your cursor on the opening curly brace `{` of the `if` statement and use `y%` to yank the content inside (including the braces). Then move to the line below the `else` block and paste it using `p`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
class Example {
    void checkNumber(int num) {
        if (num > 0) {
            System.out.println("Positive");
        } else {
            System.out.println("Non-positive");
        }
        // Paste yanked text here
    }
}]],
                start_cursor = {7, 24}, -- Cursor on the '{' of the if statement
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.4.3 (Java) ---
" Instruction: In this Java snippet, place your cursor on the opening curly brace `{` of the `if` statement and use `y%` to yank the content inside (including the braces). Then move to the line below the `else` block and paste it using `p`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
class Example {
    void checkNumber(int num) {
        if (num > 0) {
            System.out.println("Positive");
        } else {
            System.out.println("Non-positive");
        }
        // Paste yanked text here
        {
            System.out.println("Positive");
        }
    }
}]] -- The if block content should be pasted below the comment
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
                setup_text = [[
" --- Exercise 9.5.1 (Lua) ---
" Instruction: In this Lua snippet, use Line Visual (`V`) to select the lines inside the `if` block and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
local count = 0
if count == 0 then
  print("Count is zero")
  count = count + 1
end
print("Done")]],
                start_cursor = {6, 2}, -- Cursor on 'p' of 'print'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.5.1 (Lua) ---
" Instruction: In this Lua snippet, use Line Visual (`V`) to select the lines inside the `if` block and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
local count = 0
if count == 0 then
end
print("Done")]] -- The two lines inside the if should be gone
                },
                feedback = "You deleted lines in a Lua snippet!",
            },
             {
                instruction = "In this Go snippet, use Block Visual (`<C-v>`) to delete the type declaration (`int`) from the slice definition. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.5.2 (Go) ---
" Instruction: In this Go snippet, use Block Visual (`<C-v>`) to delete the type declaration (`int`) from the slice definition. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
package main

import "fmt"

func main() {
    numbers := []int{1, 2, 3}
    fmt.Println(numbers)
}]],
                start_cursor = {8, 17}, -- Cursor on 'i' of 'int'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.5.2 (Go) ---
" Instruction: In this Go snippet, use Block Visual (`<C-v>`) to delete the type declaration (`int`) from the slice definition. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
package main

import "fmt"

func main() {
    numbers := []{1, 2, 3}
    fmt.Println(numbers)
}]], -- 'int' should be deleted
                },
                feedback = "You deleted a type declaration using Block Visual!",
            },
             {
                instruction = "In this Dart snippet, place your cursor on the opening parenthesis `(` of the `print` call and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = [[
" --- Exercise 9.5.3 (Dart) ---
" Instruction: In this Dart snippet, place your cursor on the opening parenthesis `(` of the `print` call and press `%`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
void main() {
  print('Hello, world!');
}]],
                start_cursor = {6, 8}, -- Cursor on the '(' after print
                validation = { type = 'check_cursor_position', target_cursor = {6, 22} }, -- Target is the closing ')'
                feedback = "You jumped to the matching parenthesis in Dart!",
            },
             {
                instruction = "In this SQL snippet, use Line Visual (`V`) to select the `FROM` and `WHERE` clauses and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.5.4 (SQL) ---
" Instruction: In this SQL snippet, use Line Visual (`V`) to select the `FROM` and `WHERE` clauses and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
SELECT column1, column2
FROM your_table
WHERE condition = true;]],
                start_cursor = {6, 0}, -- Cursor on 'F' of FROM
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.5.4 (SQL) ---
" Instruction: Use Line Visual (`V`) to select the `FROM` and `WHERE` clauses and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
SELECT column1, column2]] -- FROM and WHERE lines should be gone
                },
                feedback = "You deleted SQL clauses using Line Visual!",
            },
             {
                instruction = "In this Rust snippet, place your cursor on the opening curly brace `{` of the `main` function and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = [[
" --- Exercise 9.5.5 (Rust) ---
" Instruction: In this Rust snippet, place your cursor on the opening curly brace `{` of the `main` function and press `%`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
fn main() {
    println!("Hello, world!");
}]],
                start_cursor = {5, 10}, -- Cursor on the '{'
                validation = { type = 'check_cursor_position', target_cursor = {7, 1} }, -- Target is the closing '}'
                feedback = "You jumped to the matching curly brace in Rust!",
            },
             {
                instruction = "In this Swift snippet, use Line Visual (`V`) to select the two lines inside the `struct` and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.5.6 (Swift) ---
" Instruction: In this Swift snippet, use Line Visual (`V`) to select the two lines inside the `struct` and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
struct Person {
    var name: String
    var age: Int
}
let person = Person(name: "Alice", age: 30)]],
                start_cursor = {6, 4}, -- Cursor on 'v' of var name
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.5.6 (Swift) ---
" Instruction: In this Swift snippet, use Line Visual (`V`) to select the two lines inside the `struct` and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
struct Person {
}
let person = Person(name: "Alice", age: 30)]] -- The two var lines should be gone
                },
                feedback = "You deleted lines in a Swift snippet!",
            },
             {
                instruction = "In this Ruby snippet, place your cursor on the opening parenthesis `(` and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = [[
" --- Exercise 9.5.7 (Ruby) ---
" Instruction: In this Ruby snippet, place your cursor on the opening parenthesis `(` and press `%`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
def greet(name)
  puts "Hello, #{name}!"
end]],
                start_cursor = {5, 9}, -- Cursor on the '('
                validation = { type = 'check_cursor_position', target_cursor = {5, 14} }, -- Target is the closing ')'
                feedback = "You jumped to the matching parenthesis in Ruby!",
            },
             {
                instruction = "In this PHP snippet, use Block Visual (`<C-v>`) to delete the '$' character at the start of the variables in the function. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.5.8 (PHP) ---
" Instruction: In this PHP snippet, use Block Visual (`<C-v>`) to delete the '$' character at the start of the variables in the function. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<?php
function add($a, $b) {
    $sum = $a + $b;
    return $sum;
}
?>]],
                start_cursor = {7, 4}, -- Cursor on the '$' of $sum
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.5.8 (PHP) ---
" Instruction: In this PHP snippet, use Block Visual (`<C-v>`) to delete the '$' character at the start of the variables in the function. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<?php
function add($a, $b) {
    sum = a + b;
    return sum;
}
?>]] -- '$' should be deleted from $sum and $a, $b if selected correctly
                },
                feedback = "You deleted '$' characters using Block Visual!",
            },
             {
                instruction = "In this C++ snippet, place your cursor on the opening curly brace `{` of the `main` function and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = [[
" --- Exercise 9.5.9 (C++) ---
" Instruction: In this C++ snippet, place your cursor on the opening curly brace `{` of the `main` function and press `%`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <iostream>

int main() {
    std::cout << "Hello, world!" << std::endl;
    return 0;
}]],
                start_cursor = {6, 14}, -- Cursor on the '{'
                validation = { type = 'check_cursor_position', target_cursor = {9, 1} }, -- Target is the closing '}'
                feedback = "You jumped to the matching curly brace in C++!",
            },
             {
                instruction = "In this C# snippet, use Line Visual (`V`) to select the two lines inside the `if` block and yank them (`y`). Then move to the line below the `else` block and paste them (`p`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.5.10 (C#) ---
" Instruction: In this C# snippet, use Line Visual (`V`) to select the two lines inside the `if` block and yank them (`y`). Then move to the line below the `else` block and paste them (`p`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
public class Greeter
{
    public void Greet(bool sayHello)
    {
        if (sayHello)
        {
            Console.WriteLine("Hello");
            Console.WriteLine("World");
        }
        else
        {
            Console.WriteLine("Goodbye");
        }
        // Paste yanked lines here
    }
}]],
                start_cursor = {8, 12}, -- Cursor on 'C' of Console.WriteLine("Hello")
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.5.10 (C#) ---
" Instruction: In this C# snippet, use Line Visual (`V`) to select the two lines inside the `if` block and yank them (`y`). Then move to the line below the `else` block and paste them (`p`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
public class Greeter
{
    public void Greet(bool sayHello)
    {
        if (sayHello)
        {
            Console.WriteLine("Hello");
            Console.WriteLine("World");
        }
        else
        {
            Console.WriteLine("Goodbye");
        }
        // Paste yanked lines here
            Console.WriteLine("Hello");
            Console.WriteLine("World");
    }
}]] -- The two lines from the if block should be pasted below the comment
                },
                feedback = "You yanked and pasted lines in a C# snippet!",
            },
             {
                instruction = "In this Kotlin snippet, place your cursor on the opening parenthesis `(` of the `println` call and press `%`. Type `:LearnVim exc` to check.",
                type = "cursor_move", -- Check cursor position
                setup_text = [[
" --- Exercise 9.5.11 (Kotlin) ---
" Instruction: In this Kotlin snippet, place your cursor on the opening parenthesis `(` of the `println` call and press `%`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
fun main() {
    println("Hello, Kotlin!")
}]],
                start_cursor = {6, 11}, -- Cursor on the '(' after println
                validation = { type = 'check_cursor_position', target_cursor = {6, 27} }, -- Target is the closing ')'
                feedback = "You jumped to the matching parenthesis in Kotlin!",
            },
             {
                instruction = "In this Shell Script snippet, use Block Visual (`<C-v>`) to delete the leading '#' characters used for comments. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 9.5.12 (Shell Script) ---
" Instruction: In this Shell Script snippet, use Block Visual (`<C-v>`) to delete the leading '#' characters used for comments. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
# This is a comment
# Another comment line
# And a third one]],
                start_cursor = {5, 0}, -- Cursor on the '#' of the first line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 9.5.12 (Shell Script) ---
" Instruction: In this Shell Script snippet, use Block Visual (`<C-v>`) to delete the leading '#' characters used for comments. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
 This is a comment
 Another comment line
 And a third one]] -- '#' should be deleted
                },
                feedback = "You deleted comment characters using Block Visual!",
            },
        },
    },
    -- Add more lessons for Module 9 here if needed
    -- lesson6 = { ... }
}

