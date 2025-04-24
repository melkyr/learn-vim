-- lua/learn_vim/modules/module10.lua

-- This file contains the content for Module 10: Macros.
-- It covers recording and playing back macros for repetitive editing tasks.
-- It uses examples from various programming languages, with explicit keystroke instructions.

return {
    title = "Macros",
    lesson1 = {
        title = "Recording Macros (`q`)",
        explanation = [[
Welcome to Module 10, Lesson 10.1!

Macros are one of Vim's most powerful features for automating repetitive tasks. A macro is a sequence of keystrokes that you record and can then play back.

You record a macro in Normal mode using the `q` command, followed by the register you want to store the macro in (any letter `a` through `z`).

* **`q{register}`**: Start recording a macro into `{register}`. The cursor in the bottom left will change (e.g., to `q/`) to show you are recording.
* **`q`**: Stop recording the macro.

Once recording starts, every keystroke you type (movements, insertions, deletions, commands, etc.) is saved until you press `q` again.

Let's practice recording a simple macro. Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Record a macro into register `a` that deletes the current word (`dw`). Start recording with `qa`, type `dw`, and stop recording with `q`. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- We'll check the final mode is Normal
                setup_text = [[
" --- Exercise 10.1.1 ---
" Instruction: Record a macro into register `a` that deletes the current word (`dw`). Start recording with `qa`, type `dw`, and stop recording with `q`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

Record a macro here.]],
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Check if they returned to Normal mode
                feedback = "You recorded your first macro!",
                 -- Note: We cannot easily validate the *content* of the register programmatically here.
                 -- The next lesson will verify by playing it back.
            },
        },
    },
    lesson2 = {
        title = "Playing Back Macros (`@`)",
        explanation = [[
Welcome to Lesson 10.2!

Once you've recorded a macro, you can play it back using the `@` command, followed by the register name.

* **`@{register}`**: Play back the macro stored in `{register}`.

You can also prefix `@` with a count to play the macro multiple times:
* **`{number}@{register}`**: Play back the macro in `{register}` `{number}` times.

Let's play back the macro you recorded in the previous lesson (register `a`) to delete a word. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Assuming you recorded `dw` into register `a` in the previous lesson: Place your cursor on the word 'DELETE', then type `@a` to play the macro and delete the word. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.2.1 ---
" Instruction: Assuming you recorded `dw` into register `a` in the previous lesson: Place your cursor on the word 'DELETE', then type `@a` to play the macro and delete the word. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

DELETE this word.]],
                start_cursor = {5, 0}, -- Cursor on 'D' of 'DELETE'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.2.1 ---
" Instruction: Assuming you recorded `dw` into register `a` in the previous lesson: Place your cursor on the word 'DELETE', then type `@a` to play the macro and delete the word. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

 this word.]] -- 'DELETE ' should be removed
                },
                feedback = "You played back the macro and deleted the word!",
            },
             {
                instruction = "Record a macro into register `b` that deletes the current line (`dd`). Start with `qb`, type `dd`, stop with `q`. Then play it back twice using `2@b` to delete the next two lines. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.2.2 ---
" Instruction: Record a macro into register `b` that deletes the current line (`dd`). Start with `qb`, type `dd`, stop with `q`. Then play it back twice using `2@b` to delete the next two lines. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

Delete this line 1.
Delete this line 2.
Delete this line 3.
Keep this line.]],
                start_cursor = {5, 0}, -- Cursor on "Delete this line 1."
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.2.2 ---
" Instruction: Record a macro into register `b` that deletes the current line (`dd`). Start with `qb`, type `dd`, stop with `q`. Then play it back twice using `2@b` to delete the next two lines. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

Keep this line.]] -- The first three lines should be gone
                },
                feedback = "You played back a macro multiple times with a count!",
            },
        },
    },
    lesson3 = {
        title = "Macros for Repetitive Editing (Part 1)",
        explanation = [[
Welcome to Lesson 10.3!

Macros shine when you have a series of edits you need to repeat on multiple lines or blocks of text. The key is to record the sequence of edits *and* the movement to the next item you want to edit.

Let's practice recording a macro that performs an edit and then moves to the next line, repeating this across several lines in different languages.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this Python snippet, record a macro into register `c` that deletes the word 'print' and moves to the next line. Keystrokes: `qc` `dw` `j` `q`. Then play the macro 3 times using `3@c` to delete 'print' on the next three lines. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.3.1 (Python) ---
" Instruction: In this Python snippet, record a macro into register `c` that deletes the word 'print' and moves to the next line. Keystrokes: `qc` `dw` `j` `q`. Then play the macro 3 times using `3@c` to delete 'print' on the next three lines. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
print("Line 1")
print("Line 2")
print("Line 3")
print("Line 4")
final_print("Done")]],
                start_cursor = {5, 0}, -- Cursor on 'p' of the first 'print'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.3.1 (Python) ---
" Instruction: In this Python snippet, record a macro into register `c` that deletes the word 'print' and moves to the next line. Keystrokes: `qc` `dw` `j` `q`. Then play the macro 3 times using `3@c` to delete 'print' on the next three lines. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
("Line 1")
("Line 2")
("Line 3")
("Line 4")
final_print("Done")]], -- 'print' should be deleted from the first four lines
                },
                feedback = "You used a macro to delete and move!",
            },
             {
                instruction = "In this HTML snippet, record a macro into register `d` that deletes the opening `<li>` tag and moves to the start of the next line. Keystrokes: `qd` `/<li><Enter>` `dw` `j` `0` `q`. Then play the macro 3 times using `3@d` to delete the next three `<li>` tags. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.3.2 (HTML) ---
" Instruction: In this HTML snippet, record a macro into register `d` that deletes the opening `<li>` tag and moves to the start of the next line. Keystrokes: `qd` `/<li><Enter>` `dw` `j` `0` `q`. Then play the macro 3 times using `3@d` to delete the next three `<li>` tags. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<ul>
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
    <li>Item 4</li>
</ul>]],
                start_cursor = {6, 4}, -- Cursor on the first '<' of <li>
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.3.2 (HTML) ---
" Instruction: In this HTML snippet, record a macro into register `d` that deletes the opening `<li>` tag and moves to the start of the next line. Keystrokes: `qd` `/<li><Enter>` `dw` `j` `0` `q`. Then play the macro 3 times using `3@d` to delete the next three `<li>` tags. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<ul>
     Item 1</li>
     Item 2</li>
     Item 3</li>
     Item 4</li>
</ul>]] -- Opening <li> tags should be gone
                },
                feedback = "You used a macro to delete HTML tags!",
            },
             {
                instruction = "In this JavaScript snippet, record a macro into register `e` that changes the word 'let' to 'const' and moves to the next line. Keystrokes: `qe` `cw` `const<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@e`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.3.3 (JavaScript) ---
" Instruction: In this JavaScript snippet, record a macro into register `e` that changes the word 'let' to 'const' and moves to the next line. Keystrokes: `qe` `cw` `const<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@e`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
function updateVariables() {
    let count = 0;
    let name = "Alice";
    let isActive = true;
}
]],
                start_cursor = {6, 4}, -- Cursor on 'l' of the first 'let'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.3.3 (JavaScript) ---
" Instruction: In this JavaScript snippet, record a macro into register `e` that changes the word 'let' to 'const' and moves to the next line. Keystrokes: `qe` `cw` `const<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@e`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
function updateVariables() {
    const count = 0;
    const name = "Alice";
    let isActive = true;
}
]] -- First two 'let's should be 'const'
                },
                feedback = "You used a macro to change words!",
            },
        },
    },
     lesson4 = {
        title = "Macros for Repetitive Editing (Part 2)",
        explanation = [[
Welcome to Lesson 10.4!

Let's continue practicing macros with more languages. The key is to identify the repetitive task and the movement needed to get from one instance to the next.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this Go snippet, record a macro into register `f` that deletes the type `int` from the slice literal and moves to the next line. Keystrokes: `qf` `/int<Enter>` `dw` `j` `0` `q`. Then play the macro 2 times using `2@f`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.4.1 (Go) ---
" Instruction: In this Go snippet, record a macro into register `f` that deletes the type `int` from the slice literal and moves to the next line. Keystrokes: `qf` `/int<Enter>` `dw` `j` `0` `q`. Then play the macro 2 times using `2@f`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
package main

import "fmt"

func main() {
    numbers1 := []int{1, 2}
    numbers2 := []int{3, 4}
    numbers3 := []int{5, 6}
    fmt.Println(numbers1, numbers2, numbers3)
}
]],
                start_cursor = {8, 18}, -- Cursor on 'i' of 'int' in numbers1
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.4.1 (Go) ---
" Instruction: In this Go snippet, record a macro into register `f` that deletes the type `int` from the slice literal and moves to the next line. Keystrokes: `qf` `/int<Enter>` `dw` `j` `0` `q`. Then play the macro 2 times using `2@f`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
package main

import "fmt"

func main() {
    numbers1 := []{1, 2}
    numbers2 := []{3, 4}
    numbers3 := []{5, 6}
    fmt.Println(numbers1, numbers2, numbers3)
}
]] -- 'int' should be deleted from the first three slice literals
                },
                feedback = "You used a macro to remove types in Go!",
            },
             {
                instruction = "In this Dart snippet, record a macro into register `g` that deletes the word 'final' and moves to the next line. Keystrokes: `qg` `dw` `j` `0` `q`. Then play the macro 3 times using `3@g`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.4.2 (Dart) ---
" Instruction: In this Dart snippet, record a macro into register `g` that deletes the word 'final' and moves to the next line. Keystrokes: `qg` `dw` `j` `0` `q`. Then play the macro 3 times using `3@g`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
void main() {
  final name = 'Alice';
  final age = 30;
  final city = 'New York';
  var isStudent = false;
}
]],
                start_cursor = {6, 2}, -- Cursor on 'f' of the first 'final'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.4.2 (Dart) ---
" Instruction: In this Dart snippet, record a macro into register `g` that deletes the word 'final' and moves to the next line. Keystrokes: `qg` `dw` `j` `0` `q`. Then play the macro 3 times using `3@g`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
void main() {
   name = 'Alice';
   age = 30;
   city = 'New York';
  var isStudent = false;
}
]] -- 'final ' should be deleted from the first three lines
                },
                feedback = "You used a macro to remove 'final' in Dart!",
            },
             {
                instruction = "In this SQL snippet, record a macro into register `h` that changes the value 'true' to 'false' and moves to the next line. Keystrokes: `qh` `/true<Enter>` `cw` `false<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@h`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.4.3 (SQL) ---
" Instruction: In this SQL snippet, record a macro into register `h` that changes the value 'true' to 'false' and moves to the next line. Keystrokes: `qh` `/true<Enter>` `cw` `false<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@h`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
SELECT * FROM users WHERE is_active = true;
SELECT * FROM products WHERE is_available = true;
SELECT * FROM orders WHERE is_completed = true;
SELECT * FROM settings WHERE is_enabled = false;
]],
                start_cursor = {5, 38}, -- Cursor on 't' of the first 'true'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.4.3 (SQL) ---
" Instruction: Record a macro into register `h` that changes the value 'true' to 'false' and moves to the next line. Keystrokes: `qh` `/true<Enter>` `cw` `false<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@h`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
SELECT * FROM users WHERE is_active = false;
SELECT * FROM products WHERE is_available = false;
SELECT * FROM orders WHERE is_completed = false;
SELECT * FROM settings WHERE is_enabled = false;
]] -- First three 'true's should be 'false'
                },
                feedback = "You used a macro to change values in SQL!",
            },
        },
    },
     lesson5 = {
        title = "Macros for Repetitive Editing (Part 3)",
        explanation = [[
Welcome to Lesson 10.5!

More macro practice with different languages! Focus on the sequence of edits and the navigation steps.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this Java snippet, record a macro into register `i` that deletes the word 'public' and moves to the next line. Keystrokes: `qi` `dw` `j` `0` `q`. Then play the macro 2 times using `2@i`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.5.1 (Java) ---
" Instruction: In this Java snippet, record a macro into register `i` that deletes the word 'public' and moves to the next line. Keystrokes: `qi` `dw` `j` `0` `q`. Then play the macro 2 times using `2@i`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
public class MyClass {
    public int myField;
    public void myMethod() {
        // ...
    }
}
]],
                start_cursor = {5, 0}, -- Cursor on 'p' of the first 'public'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.5.1 (Java) ---
" Instruction: In this Java snippet, record a macro into register `i` that deletes the word 'public' and moves to the next line. Keystrokes: `qi` `dw` `j` `0` `q`. Then play the macro 2 times using `2@i`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
 class MyClass {
     int myField;
     void myMethod() {
        // ...
    }
}
]] -- 'public ' should be deleted from the first three lines
                },
                feedback = "You used a macro to remove 'public' in Java!",
            },
             {
                instruction = "In this Rust snippet, record a macro into register `j` that deletes the word 'let' and moves to the next line. Keystrokes: `qj` `dw` `j` `0` `q`. Then play the macro 2 times using `2@j`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.5.2 (Rust) ---
" Instruction: In this Rust snippet, record a macro into register `j` that deletes the word 'let' and moves to the next line. Keystrokes: `qj` `dw` `j` `0` `q`. Then play the macro 2 times using `2@j`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
fn main() {
    let x = 10;
    let y = 20;
    let z = x + y;
    println!(\"Sum: {}\", z);
}
]],
                start_cursor = {6, 4}, -- Cursor on 'l' of the first 'let'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.5.2 (Rust) ---
" Instruction: In this Rust snippet, record a macro into register `j` that deletes the word 'let' and moves to the next line. Keystrokes: `qj` `dw` `j` `0` `q`. Then play the macro 2 times using `2@j`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
fn main() {
     x = 10;
     y = 20;
    let z = x + y;
    println!(\"Sum: {}\", z);
}
]] -- 'let ' should be deleted from the first two lines
                },
                feedback = "You used a macro to remove 'let' in Rust!",
            },
             {
                instruction = "In this Swift snippet, record a macro into register `k` that changes the word 'var' to 'let' and moves to the next line. Keystrokes: `qk` `cw` `let<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@k`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.5.3 (Swift) ---
" Instruction: In this Swift snippet, record a macro into register `k` that changes the word 'var' to 'let' and moves to the next line. Keystrokes: `qk` `cw` `let<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@k`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
struct Point {
    var x: Int
    var y: Int
    var description: String
}
]],
                start_cursor = {6, 4}, -- Cursor on 'v' of the first 'var'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.5.3 (Swift) ---
" Instruction: In this Swift snippet, record a macro into register `k` that changes the word 'var' to 'let' and moves to the next line. Keystrokes: `qk` `cw` `let<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@k`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
struct Point {
    let x: Int
    let y: Int
    var description: String
}
]] -- First two 'var's should be 'let'
                },
                feedback = "You used a macro to change 'var' to 'let' in Swift!",
            },
        },
    },
     lesson6 = {
        title = "Macros for Repetitive Editing (Part 4)",
        explanation = [[
Welcome to Lesson 10.6!

More macro practice! Keep refining your macro recording and playback skills.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this Ruby snippet, record a macro into register `l` that deletes the word 'puts' and moves to the next line. Keystrokes: `ql` `dw` `j` `0` `q`. Then play the macro 2 times using `2@l`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.6.1 (Ruby) ---
" Instruction: In this Ruby snippet, record a macro into register `l` that deletes the word 'puts' and moves to the next line. Keystrokes: `ql` `dw` `j` `0` `q`. Then play the macro 2 times using `2@l`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
puts "First message"
puts "Second message"
puts "Third message"
# This line is different
]],
                start_cursor = {5, 0}, -- Cursor on 'p' of the first 'puts'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.6.1 (Ruby) ---
" Instruction: In this Ruby snippet, record a macro into register `l` that deletes the word 'puts' and moves to the next line. Keystrokes: `ql` `dw` `j` `0` `q`. Then play the macro 2 times using `2@l`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
"First message"
"Second message"
puts "Third message"
# This line is different
]] -- 'puts ' should be deleted from the first two lines
                },
                feedback = "You used a macro to remove 'puts' in Ruby!",
            },
             {
                instruction = "In this PHP snippet, record a macro into register `m` that deletes the '$' character and moves to the next line. Keystrokes: `qm` `x` `j` `0` `q`. Then play the macro 3 times using `3@m`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.6.2 (PHP) ---
" Instruction: In this PHP snippet, record a macro into register `m` that deletes the '$' character and moves to the next line. Keystrokes: `qm` `x` `j` `0` `q`. Then play the macro 3 times using `3@m`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<?php
$name = "Alice";
$age = 30;
$city = "London";
$isActive = true;
?>]],
                start_cursor = {6, 0}, -- Cursor on the '$' of $name
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.6.2 (PHP) ---
" Instruction: In this PHP snippet, record a macro into register `m` that deletes the '$' character and moves to the next line. Keystrokes: `qm` `x` `j` `0` `q`. Then play the macro 3 times using `3@m`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<?php
name = "Alice";
age = 30;
city = "London";
$isActive = true;
?>]] -- '$' should be deleted from the first three variable lines
                },
                feedback = "You used a macro to remove '$' in PHP!",
            },
             {
                instruction = "In this C++ snippet, record a macro into register `n` that deletes the word 'std::' and moves to the next line. Keystrokes: `qn` `dw` `j` `0` `q`. Then play the macro 2 times using `2@n`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.6.3 (C++) ---
" Instruction: In this C++ snippet, record a macro into register `n` that deletes the word 'std::' and moves to the next line. Keystrokes: `qn` `dw` `j` `0` `q`. Then play the macro 2 times using `2@n`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <iostream>

int main() {
    std::cout << "Hello";
    std::cout << " ";
    std::cout << "world!" << std::endl;
    return 0;
}
]],
                start_cursor = {6, 4}, -- Cursor on 's' of the first 'std::'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.6.3 (C++) ---
" Instruction: In this C++ snippet, record a macro into register `n` that deletes the word 'std::' and moves to the next line. Keystrokes: `qn` `dw` `j` `0` `q`. Then play the macro 2 times using `2@n`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <iostream>

int main() {
    cout << "Hello";
    cout << " ";
    std::cout << "world!" << std::endl;
    return 0;
}
]] -- 'std::' should be deleted from the first two cout lines
                },
                feedback = "You used a macro to remove 'std::' in C++!",
            },
        },
    },
     lesson7 = {
        title = "Macros for Repetitive Editing (Part 5)",
        explanation = [[
Welcome to Lesson 10.7!

Final practice round for macros with more diverse languages. Focus on accurately recording the sequence and using the count for playback.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
             {
                instruction = "In this C# snippet, record a macro into register `o` that deletes the word 'public' and moves to the next line. Keystrokes: `qo` `dw` `j` `0` `q`. Then play the macro 2 times using `2@o`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.7.1 (C#) ---
" Instruction: In this C# snippet, record a macro into register `o` that deletes the word 'public' and moves to the next line. Keystrokes: `qo` `dw` `j` `0` `q`. Then play the macro 2 times using `2@o`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
public class Example {
    public string Name { get; set; }
    public int Age { get; set; }
    private bool IsActive { get; set; }
}
]],
                start_cursor = {5, 0}, -- Cursor on 'p' of the first 'public'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.7.1 (C#) ---
" Instruction: In this C# snippet, record a macro into register `o` that deletes the word 'public' and moves to the next line. Keystrokes: `qo` `dw` `j` `0` `q`. Then play the macro 2 times using `2@o`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
 class Example {
     string Name { get; set; }
     int Age { get; set; }
    private bool IsActive { get; set; }
}
]] -- 'public ' should be deleted from the first three lines
                },
                feedback = "You used a macro to remove 'public' in C#!",
            },
             {
                instruction = "In this Kotlin snippet, record a macro into register `p` that changes the word 'val' to 'var' and moves to the next line. Keystrokes: `qp` `cw` `var<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@p`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.7.2 (Kotlin) ---
" Instruction: In this Kotlin snippet, record a macro into register `p` that changes the word 'val' to 'var' and moves to the next line. Keystrokes: `qp` `cw` `var<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@p`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
fun main() {
    val name = "Alice"
    val age = 30
    val city = "Berlin"
    println("$name is $age")
}
]],
                start_cursor = {6, 4}, -- Cursor on 'v' of the first 'val'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.7.2 (Kotlin) ---
" Instruction: In this Kotlin snippet, record a macro into register `p` that changes the word 'val' to 'var' and moves to the next line. Keystrokes: `qp` `cw` `var<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@p`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
fun main() {
    var name = "Alice"
    var age = 30
    val city = "Berlin"
    println("$name is $age")
}
]] -- First two 'val's should be 'var'
                },
                feedback = "You used a macro to change 'val' to 'var' in Kotlin!",
            },
             {
                instruction = "In this Shell Script snippet, record a macro into register `r` that deletes the word 'echo' and moves to the next line. Keystrokes: `qr` `dw` `j` `0` `q`. Then play the macro 2 times using `2@r`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.7.3 (Shell Script) ---
" Instruction: In this Shell Script snippet, record a macro into register `r` that deletes the word 'echo' and moves to the next line. Keystrokes: `qr` `dw` `j` `0` `q`. Then play the macro 2 times using `2@r`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
echo "Message 1"
echo "Message 2"
echo "Message 3"
# This is a comment
]],
                start_cursor = {5, 0}, -- Cursor on 'e' of the first 'echo'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.7.3 (Shell Script) ---
" Instruction: In this Shell Script snippet, record a macro into register `r` that deletes the word 'echo' and moves to the next line. Keystrokes: `qr` `dw` `j` `0` `q`. Then play the macro 2 times using `2@r`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
"Message 1"
"Message 2"
echo "Message 3"
# This is a comment
]] -- 'echo ' should be deleted from the first two lines
                },
                feedback = "You used a macro to remove 'echo' in Shell Script!",
            },
        },
    },
     lesson8 = {
        title = "Macros for Repetitive Editing (Part 6)",
        explanation = [[
Welcome to Lesson 10.8!

One more round of macro practice!

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "In this Racket snippet, record a macro into register `s` that deletes the word 'define' and moves to the next line. Keystrokes: `qs` `dw` `j` `0` `q`. Then play the macro 2 times using `2@s`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.8.1 (Racket) ---
" Instruction: In this Racket snippet, record a macro into register `s` that deletes the word 'define' and moves to the next line. Keystrokes: `qs` `dw` `j` `0` `q`. Then play the macro 2 times using `2@s`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(define (func1 x) (+ x 1))
(define (func2 y) (* y 2))
(define (func3 z) (- z 3))
]],
                start_cursor = {5, 1}, -- Cursor on 'd' of the first 'define'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.8.1 (Racket) ---
" Instruction: In this Racket snippet, record a macro into register `s` that deletes the word 'define' and moves to the next line. Keystrokes: `qs` `dw` `j` `0` `q`. Then play the macro 2 times using `2@s`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
( (func1 x) (+ x 1))
( (func2 y) (* y 2))
(define (func3 z) (- z 3))
]] -- 'define ' should be deleted from the first two lines
                },
                feedback = "You used a macro to remove 'define' in Racket!",
            },
             {
                instruction = "In this C# snippet, record a macro into register `t` that changes the word 'int' to 'double' and moves to the next line. Keystrokes: `qt` `cw` `double<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@t`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.8.2 (C#) ---
" Instruction: In this C# snippet, record a macro into register `t` that changes the word 'int' to 'double' and moves to the next line. Keystrokes: `qt` `cw` `double<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@t`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
public class Numbers {
    public int value1;
    public int value2;
    public int value3;
    public string name;
}
]],
                start_cursor = {6, 11}, -- Cursor on 'i' of the first 'int'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.8.2 (C#) ---
" Instruction: In this C# snippet, record a macro into register `t` that changes the word 'int' to 'double' and moves to the next line. Keystrokes: `qt` `cw` `double<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@t`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
public class Numbers {
    public double value1;
    public double value2;
    public int value3;
    public string name;
}
]] -- First two 'int's should be 'double'
                },
                feedback = "You used a macro to change 'int' to 'double' in C#!",
            },
             {
                instruction = "In this Kotlin snippet, record a macro into register `u` that deletes the word 'println' and moves to the next line. Keystrokes: `qu` `dw` `j` `0` `q`. Then play the macro 2 times using `2@u`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 10.8.3 (Kotlin) ---
" Instruction: In this Kotlin snippet, record a macro into register `u` that deletes the word 'println' and moves to the next line. Keystrokes: `qu` `dw` `j` `0` `q`. Then play the macro 2 times using `2@u`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
fun main() {
    println("Message 1")
    println("Message 2")
    println("Message 3")
}
]],
                start_cursor = {6, 4}, -- Cursor on 'p' of the first 'println'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 10.8.3 (Kotlin) ---
" Instruction: In this Kotlin snippet, record a macro into register `u` that deletes the word 'println' and moves to the next line. Keystrokes: `qu` `dw` `j` `0` `q`. Then play the macro 2 times using `2@u`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
fun main() {
    ("Message 1")
    ("Message 2")
    println("Message 3")
}
]] -- 'println' should be deleted from the first two lines
                },
                feedback = "You used a macro to remove 'println' in Kotlin!",
            },
        },
    },
    -- Add more lessons for Module 10 here if needed
    -- lesson9 = { ... }
}

