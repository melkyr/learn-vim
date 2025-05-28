-- lua/learn_vim/modules/module10.lua

-- This file contains the content for Module 10: Macros.
-- It covers recording and playing back macros for repetitive editing tasks.
-- It uses examples from various programming languages, with explicit keystroke instructions.

local Utils = require('learn_vim.utils')

return {
    title = "Macros",
    lesson1 = {
        title = "Recording Macros (`q`)",
        explanation = [[
Welcome to Module 10, Lesson 10.1!

Macros are one of Vim's most powerful features for automating repetitive tasks. A macro is a sequence of keystrokes that you record and can then play back.

You record a macro in Normal mode using the `q` command, followed by the register you want to store the macro in (any letter `a` through `z`).

* **`q{register}`**: Start recording a macro into `{register}`. The cursor in the bottom left will change (the command line will show an indicator like 'recording @a' or an older 'q/a' to show you are recording into register 'a') to show you are recording.
* **`q`**: Stop recording the macro.

Once recording starts, every keystroke you type (movements, insertions, deletions, commands, etc.) is saved until you press `q` again.

Let's practice recording a simple macro. Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Record a macro into register `a` that deletes the current word (`dw`). Start recording with `qa`, type `dw`, and stop recording with `q`. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- We'll check the final mode is Normal
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson1_exercise1_setup.txt"),
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
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson2_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on 'D' of 'DELETE'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson2_exercise1_target.txt")
                },
                feedback = "You played back the macro and deleted the word!",
            },
             {
                instruction = "Record a macro into register `b` that deletes the current line (`dd`). Start with `qb`, type `dd`, stop with `q`. Then play it back twice using `2@b` to delete the next two lines. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson2_exercise2_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on "Delete this line 1."
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson2_exercise2_target.txt")
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
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson3_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on 'p' of the first 'print'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson3_exercise1_target.txt")
                },
                feedback = "You used a macro to delete and move!",
            },
             {
                instruction = "In this HTML snippet, record a macro into register `d` that deletes the opening `<li>` tag and moves to the start of the next line. Keystrokes: `qd` `/<li><Enter>` `dw` `j` `0` `q`. Then play the macro 3 times using `3@d` to delete the next three `<li>` tags. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson3_exercise2_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on the first '<' of <li>
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson3_exercise2_target.txt")
                },
                feedback = "You used a macro to delete HTML tags!",
            },
             {
                instruction = "In this JavaScript snippet, record a macro into register `e` that changes the word 'let' to 'const' and moves to the next line. Keystrokes: `qe` `cw` `const<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@e`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson3_exercise3_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on 'l' of the first 'let'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson3_exercise3_target.txt")
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
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson4_exercise1_setup.txt"),
                start_cursor = {8, 18}, -- Cursor on 'i' of 'int' in numbers1
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson4_exercise1_target.txt")
                },
                feedback = "You used a macro to remove types in Go!",
            },
             {
                instruction = "In this Dart snippet, record a macro into register `g` that deletes the word 'final' and moves to the next line. Keystrokes: `qg` `dw` `j` `0` `q`. Then play the macro 3 times using `3@g`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson4_exercise2_setup.txt"),
                start_cursor = {6, 2}, -- Cursor on 'f' of the first 'final'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson4_exercise2_target.txt")
                },
                feedback = "You used a macro to remove 'final' in Dart!",
            },
             {
                instruction = "In this SQL snippet, record a macro into register `h` that changes the value 'true' to 'false' and moves to the next line. Keystrokes: `qh` `/true<Enter>` `cw` `false<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@h`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson4_exercise3_setup.txt"),
                start_cursor = {5, 38}, -- Cursor on 't' of the first 'true'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson4_exercise3_target.txt")
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
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson5_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on 'p' of the first 'public'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson5_exercise1_target.txt")
                },
                feedback = "You used a macro to remove 'public' in Java!",
            },
             {
                instruction = "In this Rust snippet, record a macro into register `j` that deletes the word 'let' and moves to the next line. Keystrokes: `qj` `dw` `j` `0` `q`. Then play the macro 2 times using `2@j`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson5_exercise2_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on 'l' of the first 'let'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson5_exercise2_target.txt")
                },
                feedback = "You used a macro to remove 'let' in Rust!",
            },
             {
                instruction = "In this Swift snippet, record a macro into register `k` that changes the word 'var' to 'let' and moves to the next line. Keystrokes: `qk` `cw` `let<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@k`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson5_exercise3_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on 'v' of the first 'var'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson5_exercise3_target.txt")
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
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson6_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on 'p' of the first 'puts'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson6_exercise1_target.txt")
                },
                feedback = "You used a macro to remove 'puts' in Ruby!",
            },
             {
                instruction = "In this PHP snippet, record a macro into register `m` that deletes the '$' character and moves to the next line. Keystrokes: `qm` `x` `j` `0` `q`. Then play the macro 3 times using `3@m`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson6_exercise2_setup.txt"),
                start_cursor = {6, 0}, -- Cursor on the '$' of $name
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson6_exercise2_target.txt")
                },
                feedback = "You used a macro to remove '$' in PHP!",
            },
             {
                instruction = "In this C++ snippet, record a macro into register `n` that deletes the word 'std::' and moves to the next line. Keystrokes: `qn` `dw` `j` `0` `q`. Then play the macro 2 times using `2@n`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson6_exercise3_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on 's' of the first 'std::'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson6_exercise3_target.txt")
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
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson7_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on 'p' of the first 'public'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson7_exercise1_target.txt")
                },
                feedback = "You used a macro to remove 'public' in C#!",
            },
             {
                instruction = "In this Kotlin snippet, record a macro into register `p` that changes the word 'val' to 'var' and moves to the next line. Keystrokes: `qp` `cw` `var<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@p`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson7_exercise2_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on 'v' of the first 'val'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson7_exercise2_target.txt")
                },
                feedback = "You used a macro to change 'val' to 'var' in Kotlin!",
            },
             {
                instruction = "In this Shell Script snippet, record a macro into register `r` that deletes the word 'echo' and moves to the next line. Keystrokes: `qr` `dw` `j` `0` `q`. Then play the macro 2 times using `2@r`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson7_exercise3_setup.txt"),
                start_cursor = {5, 0}, -- Cursor on 'e' of the first 'echo'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson7_exercise3_target.txt")
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
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson8_exercise1_setup.txt"),
                start_cursor = {5, 1}, -- Cursor on 'd' of the first 'define'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson8_exercise1_target.txt")
                },
                feedback = "You used a macro to remove 'define' in Racket!",
            },
             {
                instruction = "In this C# snippet, record a macro into register `t` that changes the word 'int' to 'double' and moves to the next line. Keystrokes: `qt` `cw` `double<Esc>` `j` `0` `q`. Then play the macro 2 times using `2@t`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson8_exercise2_setup.txt"),
                start_cursor = {6, 11}, -- Cursor on 'i' of the first 'int'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson8_exercise2_target.txt")
                },
                feedback = "You used a macro to change 'int' to 'double' in C#!",
            },
             {
                instruction = "In this Kotlin snippet, record a macro into register `u` that deletes the word 'println' and moves to the next line. Keystrokes: `qu` `dw` `j` `0` `q`. Then play the macro 2 times using `2@u`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson8_exercise3_setup.txt"),
                start_cursor = {6, 4}, -- Cursor on 'p' of the first 'println'
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module10_lesson8_exercise3_target.txt")
                },
                feedback = "You used a macro to remove 'println' in Kotlin!",
            },
        },
    },
    -- Add more lessons for Module 10 here if needed
    -- lesson9 = { ... }
}
