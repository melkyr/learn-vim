-- lua/learn_vim/modules/module11.lua

-- This file contains the content for Module 11: Final Test.
-- It includes exercises testing various Vim skills using snippets from diverse programming languages.

local Utils = require('learn_vim.utils')

return {
    title = "Final Test",
    lesson1 = {
        title = "Final Test - Part 1 (Editing Basics)",
        explanation = [[
Welcome to Module 11, Lesson 11.1 - the Final Test!

This test covers commands and concepts from all previous modules. Each exercise presents a code snippet in a different language and a task to perform. Use the Vim commands you've learned to achieve the target state.

Hints are minimal; apply your knowledge of navigation, insertion, deletion, changing, yanking, putting, repetition, and visual mode.

Remember to use `:LearnVim exc` to check your work and `:LearnVim exr` to reset if needed. Good luck!
]],
        exercises = {
            {
                instruction = "In this C snippet, delete the line containing `printf(\"World!\\n\");`. Use any deletion command you prefer. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson1_exercise1_setup.txt"),
                start_cursor = {5, 0},
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson1_exercise1_target.txt")
                },
                feedback = "Test 1.1 complete!",
            },
             {
                instruction = "In this Assembly snippet, change the instruction `mov eax, 1` to `mov ebx, 0`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson1_exercise2_setup.txt"),
                start_cursor = {7, 4}, -- Cursor on 'm' of mov eax, 1
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson1_exercise2_target.txt")
                },
                feedback = "Test 1.2 complete!",
            },
             {
                instruction = "In this Fortran snippet, yank the line `  PRINT *, 'Hello'` and paste it below the line `  PRINT *, 'World'`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson1_exercise3_setup.txt"),
                start_cursor = {6, 2}, -- Cursor on 'P' of the first PRINT
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson1_exercise3_target.txt")
                },
                feedback = "Test 1.3 complete!",
            },
        },
    },
    lesson2 = {
        title = "Final Test - Part 2 (Visual Mode & Substitution)",
        explanation = [[
Welcome to Lesson 11.2!

More exercises to test your skills, focusing on Visual mode and the `:s` substitution command.
]],
        exercises = {
            {
                instruction = "In this COBOL snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the PROCEDURE DIVISION. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson2_exercise1_setup.txt"),
                start_cursor = {8, 7}, -- Cursor on the first space of DISPLAY
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson2_exercise1_target.txt")
                },
                feedback = "Test 2.1 complete!",
            },
             {
                instruction = "In this Common Lisp snippet, use Line Visual (`V`) to select the two lines inside the `let` form and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson2_exercise2_setup.txt"),
                start_cursor = {6, 2}, -- Cursor on the first '(' of the let form
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson2_exercise2_target.txt")
                },
                feedback = "Test 2.2 complete!",
            },
             {
                instruction = "In this Prolog snippet, use `:s` to replace all occurrences of `parent` with `ancestor` on the line containing `parent(X, Y)`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson2_exercise3_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on the first line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson2_exercise3_target.txt")
                },
                feedback = "Test 2.3 complete!",
            },
        },
    },
    lesson3 = {
        title = "Final Test - Part 3 (Mixed Practice)",
        explanation = [[
Welcome to Lesson 11.3!

More mixed exercises covering various commands. Apply the most efficient techniques you know!
]],
        exercises = {
            {
                instruction = "In this Haskell snippet, delete the line containing `y = 20`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson3_exercise1_setup.txt"),
                start_cursor = {5, 0},
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson3_exercise1_target.txt")
                },
                feedback = "Test 3.1 complete!",
            },
             {
                instruction = "In this Scala snippet, change the word `var` to `val` on the first two variable declarations. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson3_exercise2_setup.txt"),
                start_cursor = {7, 4}, -- Cursor on 'v' of the first 'var'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson3_exercise2_target.txt")
                },
                feedback = "Test 3.2 complete!",
            },
             {
                instruction = "In this Clojure snippet, yank the s-expression `(println \"Hello\")` and paste it below the `(println \"World\")` line. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson3_exercise3_setup.txt"),
                start_cursor = {6, 2}, -- Cursor on the first '('
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson3_exercise3_target.txt")
                },
                feedback = "Test 3.3 complete!",
            },
        },
    },
    lesson4 = {
        title = "Final Test - Part 4 (More Practice)",
        explanation = [[
Welcome to Lesson 11.4!

More exercises to solidify your skills.
]],
        exercises = {
            {
                instruction = "In this Elixir snippet, use Line Visual (`V`) to select the three lines defining the function body and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson4_exercise1_setup.txt"),
                start_cursor = {6, 2}, -- Cursor on 'm' of message
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson4_exercise1_target.txt")
                },
                feedback = "Test 4.1 complete!",
            },
             {
                instruction = "In this Erlang snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the `case` expression. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson4_exercise2_setup.txt"),
                start_cursor = {7, 8}, -- Cursor on the first space before "Alice"
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson4_exercise2_target.txt")
                },
                feedback = "Test 4.2 complete!",
            },
             {
                instruction = "In this F# snippet, change the word `let` to `mutable` on the first two variable declarations. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson4_exercise3_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on 'l' of the first 'let'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson4_exercise3_target.txt")
                },
                feedback = "Test 4.3 complete!",
            },
        },
    },
    lesson5 = {
        title = "Final Test - Part 5 (More Practice)",
        explanation = [[
Welcome to Lesson 11.5!

Almost there! A few more exercises to test your command mastery.
]],
        exercises = {
            {
                instruction = "In this TypeScript snippet, use `:s` to replace all occurrences of `string` with `number` within the `interface` definition. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson5_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on the first line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson5_exercise1_target.txt")
                },
                feedback = "Test 5.1 complete!",
            },
             {
                instruction = "In this Vue snippet, use Line Visual (`V`) to select the lines inside the `<script>` block and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson5_exercise2_setup.txt"),
                start_cursor = {8, 0}, -- Cursor on 'export default {'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson5_exercise2_target.txt")
                },
                feedback = "Test 5.2 complete!",
            },
        },
    },
    lesson6 = {
        title = "Final Test - Part 6 (More Practice)",
        explanation = [[
Welcome to Lesson 11.6!

Almost done with the practice exercises!
]],
        exercises = {
            {
                instruction = "In this Assembly snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the `section .data`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson6_exercise1_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on the first space of msg db
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson6_exercise1_target.txt")
                },
                feedback = "Test 6.1 complete!",
            },
             {
                instruction = "In this C snippet, change the word `int` to `float` in the function signature. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson6_exercise2_setup.txt"),
                start_cursor = {6, 0}, -- Cursor on 'i' of the first 'int'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson6_exercise2_target.txt")
                },
                feedback = "Test 6.2 complete!",
            },
        },
    },
    lesson7 = {
        title = "Final Test - Part 7 (More Practice)",
        explanation = [[
Welcome to Lesson 11.7!

Almost at the end of the practice exercises!
]],
        exercises = {
            {
                instruction = "In this Fortran snippet, use `:s` to replace the first occurrence of `10` with `20` on the line containing `x = 10`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson7_exercise1_setup.txt"),
                start_cursor = {7, 0}, -- Cursor on the line 'x = 10'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson7_exercise1_target.txt")
                },
                feedback = "Test 7.1 complete!",
            },
             {
                instruction = "In this COBOL snippet, use Line Visual (`V`) to select the two lines containing `DISPLAY` and `STOP RUN` and yank them (`y`). Then move to the line below `PROGRAM-ID. HELLOWORLD.` and paste them (`p`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson7_exercise2_setup.txt"),
                start_cursor = {8, 7}, -- Cursor on the DISPLAY line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson7_exercise2_target.txt")
                },
                feedback = "Test 7.2 complete!",
            },
        },
    },
    lesson8 = {
        title = "Final Test - Part 8 (More Practice)",
        explanation = [[
Welcome to Lesson 11.8!

Just a few more exercises to go!
]],
        exercises = {
            {
                instruction = "In this Common Lisp snippet, change the word `defun` to `defmacro`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson8_exercise1_setup.txt"),
                start_cursor = {5, 1}, -- Cursor on 'd' of defun
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson8_exercise1_target.txt")
                },
                feedback = "Test 8.1 complete!",
            },
             {
                instruction = "In this Prolog snippet, delete the line containing `ancestor(X, Y) :- parent(X, Y).`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson8_exercise2_setup.txt"),
                start_cursor = {7, 0}, -- Cursor on the ancestor(X, Y) :- parent(X, Y). line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson8_exercise2_target.txt")
                },
                feedback = "Test 8.2 complete!",
            },
        },
    },
    lesson9 = {
        title = "Final Test - Part 9 (More Practice)",
        explanation = [[
Welcome to Lesson 11.9!

Wrapping up the practice exercises.
]],
        exercises = {
            {
                instruction = "In this Haskell snippet, change the word `x` to `a`, `y` to `b`, and `z` to `c`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson9_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on 'x'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson9_exercise1_target.txt")
                },
                feedback = "Test 9.1 complete!",
            },
             {
                instruction = "In this Scala snippet, use `:s` to replace the first occurrence of `println` with `printf` on the last line. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson9_exercise2_setup.txt"),
                start_cursor = {10, 4}, -- Cursor on the last line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson9_exercise2_target.txt")
                },
                feedback = "Test 9.2 complete!",
            },
        },
    },
    lesson10 = {
        title = "Final Test - Part 10 (More Practice)",
        explanation = [[
Welcome to Lesson 11.10!

Almost done!
]],
        exercises = {
            {
                instruction = "In this Clojure snippet, delete the line containing `(println \"Hello\")`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson10_exercise1_setup.txt"),
                start_cursor = {6, 2}, -- Cursor on the println "Hello" line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson10_exercise1_target.txt")
                },
                feedback = "Test 10.1 complete!",
            },
             {
                instruction = "In this Elixir snippet, change the word `greet` to `say_hello`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson10_exercise2_setup.txt"),
                start_cursor = {6, 6}, -- Cursor on 'g' of greet
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson10_exercise2_target.txt")
                },
                feedback = "Test 10.2 complete!",
            },
        },
    },
    lesson11 = {
        title = "Final Test - Part 11 (More Practice)",
        explanation = [[
Welcome to Lesson 11.11!

Just a few more!
]],
        exercises = {
            {
                instruction = "In this Erlang snippet, use `:s` to replace the first occurrence of `io:format` with `io:fwrite` on the first case branch. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson11_exercise1_setup.txt"),
                start_cursor = {7, 8}, -- Cursor on the first case branch line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson11_exercise1_target.txt")
                },
                feedback = "Test 11.1 complete!",
            },
             {
                instruction = "In this F# snippet, use Line Visual (`V`) to select the two lines defining `name` and `age` and yank them (`y`). Then paste them below the `printfn` line (`p`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson11_exercise2_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on the 'let name' line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson11_exercise2_target.txt")
                },
                feedback = "Test 11.2 complete!",
            },
        },
    },
     lesson12 = {
        title = "Final Test - Part 12 (More Practice)",
        explanation = [[
Welcome to Lesson 11.12!

Keep going! You're doing great!
]],
        exercises = {
            {
                instruction = "In this TypeScript snippet, use Block Visual (`<C-v>`) to delete the semicolons `;` at the end of the interface properties. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson12_exercise1_setup.txt"),
                start_cursor = {6, 12}, -- Cursor on the ';' after id: string
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson12_exercise1_target.txt")
                },
                feedback = "Test 12.1 complete!",
            },
             {
                instruction = "In this Vue snippet, change the word `message` to `greeting` in the `<template>` block. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson12_exercise2_setup.txt"),
                start_cursor = {6, 12}, -- Cursor on 'm' of message
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson12_exercise2_target.txt")
                },
                feedback = "Test 12.2 complete!",
            },
        },
    },
     lesson13 = {
        title = "Final Test - Part 13 (More Practice)",
        explanation = [[
Welcome to Lesson 11.13!

Almost there! Just a couple more practice exercises.
]],
        exercises = {
            {
                instruction = "In this Assembly snippet, use `:s` to replace the first occurrence of `0xA` with `0xD, 0xA` on the line containing `msg db`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson13_exercise1_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on the msg db line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson13_exercise1_target.txt")
                },
                feedback = "Test 13.1 complete!",
            },
             {
                instruction = "In this C snippet, yank the line containing `return a + b;` and paste it below the line containing `int main() {`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson13_exercise2_setup.txt"),
                start_cursor = {7, 4}, -- Cursor on the return line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson13_exercise2_target.txt")
                },
                feedback = "Test 13.2 complete!",
            },
        },
    },
     lesson14 = {
        title = "Congratulations!",
        explanation = [[
Welcome to Lesson 11.14!

You've reached the end of the LearnVim tutorial! You've covered:
* Modal editing basics
* Essential navigation (character, word, line, file, search, find)
* Core editing actions (delete, change, yank, paste)
* Repetition and Undo/Redo
* Visual mode (character, line, block)
* Command-line mode and Registers
* Advanced editing techniques

This final exercise is a simple one to conclude the tutorial. You will insert and replace text to complete a congratulatory message.

Use `:LearnVim exc` to check when you're done!
]],
        exercises = {
            {
                instruction = "Insert text to complete the sentence: 'You have successfully completed the LearnVim tutorial!'. Place your cursor after 'You have successfully completed the ' and insert 'LearnVim tutorial!'. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson14_exercise1_setup.txt"),
                start_cursor = {5, 35}, -- Cursor after "the "
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson14_exercise1_target.txt")
                },
                feedback = "Almost there! Now for the final message.",
            },
             {
                instruction = "Replace the placeholder text `[Your Name]` with your name and `[Your Effort]` with a word describing your effort (e.g., 'great', 'hard'). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson14_exercise2_setup.txt"),
                start_cursor = {5, 17}, -- Cursor on '[' of [Your Name]
                validation = {
                    type = 'check_buffer_content_regex', -- Need regex validation
                    target_content_pattern = Utils.read_file_content("lua/learn_vim/exercise_content/module11_lesson14_exercise2_target.txt")
                },
                feedback = "Congratulations on completing the LearnVim tutorial!",
                -- TODO: Implement 'check_buffer_content_regex' validation type.
            },
        },
    },
    -- End of Module 11
}

