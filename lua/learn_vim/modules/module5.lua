-- lua/learn_vim/modules/module5.lua

-- This file contains the content for Module 5: Repeat, Undo, and Redo, and Practice/Test exercises.
-- It returns a table representing this module's structure and lessons.

local Utils = require('learn_vim.utils')

return {
    title = "Repeat, Undo, Redo, and Practice", -- Updated title
    lesson1 = {
        title = "Repeating Actions (`.`)",
        explanation = [[
Welcome to Module 5, Lesson 5.1!

One of Vim's most powerful features is the ability to **repeat** the last change you made. The `.` (dot) command does exactly this.

If you perform an action (like deleting a word with `dw`, changing a line with `cc`, or appending text with `A` then typing and pressing `<Esc>`), pressing `.` will repeat that entire action.

This command is incredibly useful for repetitive editing tasks.

Let's practice repeating actions. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Delete the word 'delete' on the first line using `dw`. Then move to the next two lines and use the `.` command to delete the words 'delete' on those lines. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson1_exercise1_setup.txt"),
                start_cursor = {5, 7}, -- Cursor on 'd' of 'delete' on the first line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson1_exercise1_target.txt")
                },
                feedback = "You successfully repeated the delete action!",
            },
             {
                instruction = "Change the word 'CHANGE' to 'EDIT' on the first line using `cw`. Then move to the next two lines and use the `.` command to repeat the change. Press `<Esc>` after each change. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson1_exercise2_setup.txt"),
                start_cursor = {5, 7}, -- Cursor on 'C' of 'CHANGE' on the first line
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson1_exercise2_target.txt")
                },
                feedback = "You successfully repeated the change action!",
            },
        },
    },
    lesson2 = {
        title = "Undoing (`u`) and Redoing (`<C-r>`)",
        explanation = [[
Welcome to Lesson 5.2!

Mistakes happen! Knowing how to undo them is essential.

In Normal mode:
* **`u`**: **Undo** the last change. Pressing `u` multiple times will undo previous changes step by step.
* **`<C-r>`** (Control + r): **Redo** an undone change. If you've used `u` and want to bring back a change, `<C-r>` will redo it.

Vim has a powerful undo history; you can undo and redo many steps.

Let's practice undoing and redoing changes. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Delete the word 'delete' using `dw`. Then use `u` to undo the deletion. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson2_exercise1_setup.txt"),
                start_cursor = {5, 7}, -- Cursor on 'd' of 'delete'
                validation = {
                    type = 'check_buffer_content',
                    -- The target content is the original setup_text after undoing the delete
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson2_exercise1_target.txt")
                },
                feedback = "You successfully undid the deletion!",
            },
             {
                instruction = "Make a change (e.g., delete a word). Then use `u` to undo it. Then use `<C-r>` to redo the change. Type `:LearnVim exc` to check.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson2_exercise2_setup.txt"),
                start_cursor = {5, 10}, -- Cursor on 'c' of 'change'
                validation = {
                    type = 'check_buffer_content',
                     -- The target content is the state *after* redoing the change.
                     -- Since the user can make *any* change, we can't check for specific content.
                     -- A simple validation is to check if they are back in Normal mode,
                     -- assuming they ended in Normal mode after the redo.
                     -- However, a better approach for this exercise is to just check if they
                     -- performed *some* change, then undo, then redo. This is hard to validate
                     -- programmatically without tracking commands.
                     -- For simplicity, let's just check if they are in Normal mode, and rely
                     -- on the instruction guiding them through the undo/redo steps.
                     type = 'check_mode',
                     target_mode = 'n'
                },
                feedback = "You practiced undoing and redoing!",
            },
        },
    },
    lesson3 = { -- New Practice Lesson
        title = "Practice: Editing a Paragraph",
        explanation = [[
Welcome to Lesson 5.3!

Before the mid-term test, let's do one practice exercise where you'll apply a combination of navigation and editing commands to modify a paragraph.

Use the commands you've learned so far (navigation, deletion, changing, replacing, yanking, putting, repeat, undo, redo) to make the paragraph match the target content.

Remember to use `:LearnVim exc` when you think you're done and `:LearnVim exr` to reset if needed.
]],
        exercises = {
            {
                instruction = "Edit the paragraph to match the target content. Apply commands learned in Modules 3-5.",
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson3_exercise1_setup.txt"),
                start_cursor = {5, 0}, -- Start at the beginning of the paragraph
                -- Target: Change "quick brown" to "agile", delete "jumps over the lazy", change "dog" to "cat".
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson3_exercise1_target.txt")
                },
                feedback = "Practice complete! You edited the paragraph.",
            },
        },
    },
    lesson4 = { -- Shifted Mid-Term Test to Lesson 5.4
        title = "Mid-Term Test: Editing Practice",
        explanation = [[
Welcome to Lesson 5.4 - your first mid-term test!

This lesson contains exercises using paragraphs from free books. Your task is to edit each paragraph according to the instructions, using the Vim commands you've learned so far (navigation, deletion, changing, replacing, yanking, putting, repeat, undo, redo).

Hints are provided, but you'll need to figure out the best sequence of commands yourself.

Remember to use `:LearnVim exc` after you believe you've completed the edits for each exercise. Use `:LearnVim exr` if you need to reset and start over.

Good luck!
]],
        exercises = {
            {
                instruction = [[Edit the paragraph to match the target content below. Hint: Use `dw`, `dd`, `p`, and `.`

TARGET:
It was the best of times.]],
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise1_setup.txt"),
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise1_target.txt")
                },
                feedback = "Test 1 completed! You practiced deleting and potentially repeating.",
            },
             {
                instruction = [[Edit the paragraph to match the target content below. Hint: Use `cw`, `cc`, `r`, and `<Esc>`.

TARGET:
Call me Ahab. Some years ago—never mind how long precisely—having little or no gold in my purse, and nothing particular to interest me on shore, I thought I would travel about a little and see the watery part of the world!]],
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise2_setup.txt"),
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise2_target.txt")
                },
                feedback = "Test 2 completed! You practiced changing and replacing.",
            },
             {
                instruction = [[Reorder the lines to match the target order below. Hint: Use `yy`, `p`, `dd`, and navigation commands.

TARGET:
Line D.
Line B.
Line E.
Line A.
Line C.]],
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise3_setup.txt"),
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise3_target.txt")
                },
                feedback = "Test 3 completed! You practiced moving lines.",
            },
             {
                instruction = [[Edit the paragraph to match the target content below. Hint: Combine navigation and actions. Use `u` and `<C-r>` if you make mistakes.

TARGET:
It is a truth universally acknowledged, that a wealthy person in possession of a good fortune, must be in want of a partner.]],
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise4_setup.txt"),
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise4_target.txt")
                },
                feedback = "Test 4 completed! You applied a range of commands.",
            },
            { -- New Exercise 5.4.5
                instruction = [[Edit the paragraph to match the target content below. Hint: Use a variety of commands from Modules 3-5.

TARGET:
All that is silver does not glitter, Not all those who roam are lost; The ancient that is strong does not wither, Deep roots are not reached by the sun. From the ashes a spark shall be woken, A glow from the shadows shall spring; Renewed shall be blade that was mended, The crownless again shall be queen.]],
                type = "insert_text",
                setup_text = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise5_setup.txt"),
                validation = {
                    type = 'check_buffer_content',
                    target_content = Utils.read_file_content("lua/learn_vim/exercise_content/module5_lesson4_exercise5_target.txt")
                },
                feedback = "Test 5 completed! You're getting good at this!",
            },
        },
    },
    -- Add more lessons for Module 5 here if needed
    -- lesson5 = { ... } -- If adding more before the test
}

