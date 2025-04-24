-- lua/learn_vim/modules/module11.lua

-- This file contains the content for Module 11: Final Test.
-- It includes exercises testing various Vim skills using snippets from diverse programming languages.

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
                setup_text = [[
" --- Exercise 11.1.1 (C) ---
" Instruction: In this C snippet, delete the line containing `printf(\"World!\\n\");`. Use any deletion command you prefer. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <stdio.h>

int main() {
    printf("Hello, ");
    printf("World!\\n");
    return 0;
}]],
                start_cursor = {5, 0},
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.1.1 (C) ---
" Instruction: In this C snippet, delete the line containing `printf(\"World!\\n\");`. Use any deletion command you prefer. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <stdio.h>

int main() {
    printf("Hello, ");
    return 0;
}]] -- The printf("World!\n"); line should be gone
                },
                feedback = "Test 1.1 complete!",
            },
             {
                instruction = "In this Assembly snippet, change the instruction `mov eax, 1` to `mov ebx, 0`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.1.2 (Assembly - GAS) ---
" Instruction: In this Assembly snippet, change the instruction `mov eax, 1` to `mov ebx, 0`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
.global _start

_start:
    mov eax, 1
    mov ebx, 0
    int 0x80]],
                start_cursor = {7, 4}, -- Cursor on 'm' of mov eax, 1
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.1.2 (Assembly - GAS) ---
" Instruction: In this Assembly snippet, change the instruction `mov eax, 1` to `mov ebx, 0`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
.global _start

_start:
    mov ebx, 0
    mov ebx, 0
    int 0x80]] -- The line should be changed
                },
                feedback = "Test 1.2 complete!",
            },
             {
                instruction = "In this Fortran snippet, yank the line `  PRINT *, 'Hello'` and paste it below the line `  PRINT *, 'World'`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.1.3 (Fortran) ---
" Instruction: In this Fortran snippet, yank the line `  PRINT *, 'Hello'` and paste it below the line `  PRINT *, 'World'`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
PROGRAM HelloWorld
  PRINT *, 'Hello'
  PRINT *, 'World'
END PROGRAM HelloWorld]],
                start_cursor = {6, 2}, -- Cursor on 'P' of the first PRINT
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.1.3 (Fortran) ---
" Instruction: In this Fortran snippet, yank the line `  PRINT *, 'Hello'` and paste it below the line `  PRINT *, 'World'`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
PROGRAM HelloWorld
  PRINT *, 'Hello'
  PRINT *, 'World'
  PRINT *, 'Hello'
END PROGRAM HelloWorld]] -- The first print line should be duplicated below the second
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
                setup_text = [[
" --- Exercise 11.2.1 (COBOL) ---
" Instruction: In this COBOL snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the PROCEDURE DIVISION. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.
       PROCEDURE DIVISION.
           DISPLAY 'Hello, World!'.
           STOP RUN.
]],
                start_cursor = {8, 7}, -- Cursor on the first space of DISPLAY
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.2.1 (COBOL) ---
" Instruction: In this COBOL snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the PROCEDURE DIVISION. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.
       PROCEDURE DIVISION.
       DISPLAY 'Hello, World!'.
       STOP RUN.
]] -- Leading spaces removed from DISPLAY and STOP RUN lines
                },
                feedback = "Test 2.1 complete!",
            },
             {
                instruction = "In this Common Lisp snippet, use Line Visual (`V`) to select the two lines inside the `let` form and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.2.2 (Common Lisp) ---
" Instruction: In this Common Lisp snippet, use Line Visual (`V`) to select the two lines inside the `let` form and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(defun greet (name)
  (let ((message (format nil "Hello, ~a!" name))
        (greeting-prefix "Greeting: "))
    (concatenate 'string greeting-prefix message)))
]],
                start_cursor = {6, 2}, -- Cursor on the first '(' of the let form
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.2.2 (Common Lisp) ---
" Instruction: In this Common Lisp snippet, use Line Visual (`V`) to select the two lines inside the `let` form and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(defun greet (name)
    (concatenate 'string greeting-prefix message)))
]] -- The two lines inside let should be gone
                },
                feedback = "Test 2.2 complete!",
            },
             {
                instruction = "In this Prolog snippet, use `:s` to replace all occurrences of `parent` with `ancestor` on the line containing `parent(X, Y)`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.2.3 (Prolog) ---
" Instruction: In this Prolog snippet, use `:s` to replace all occurrences of `parent` with `ancestor` on the line containing `parent(X, Y)`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
]],
                start_cursor = {5, 0}, -- Cursor on the first line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.2.3 (Prolog) ---
" Instruction: In this Prolog snippet, use `:s` to replace all occurrences of `parent` with `ancestor` on the line containing `parent(X, Y)`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
ancestor(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
]] -- 'parent' replaced with 'ancestor' on the first line
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
                setup_text = [[
" --- Exercise 11.3.1 (Haskell) ---
" Instruction: In this Haskell snippet, delete the line containing `y = 20`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
x = 10
y = 20
z = x + y]],
                start_cursor = {5, 0},
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.3.1 (Haskell) ---
" Instruction: In this Haskell snippet, delete the line containing `y = 20`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
x = 10
z = x + y]] -- The line 'y = 20' should be gone
                },
                feedback = "Test 3.1 complete!",
            },
             {
                instruction = "In this Scala snippet, change the word `var` to `val` on the first two variable declarations. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.3.2 (Scala) ---
" Instruction: In this Scala snippet, change the word `var` to `val` on the first two variable declarations. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
object Main {
  def main(args: Array[String]): Unit = {
    var name = "Alice"
    var age = 30
    val city = "Paris"
    println(s"$name is $age in $city")
  }
}]],
                start_cursor = {7, 4}, -- Cursor on 'v' of the first 'var'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.3.2 (Scala) ---
" Instruction: In this Scala snippet, change the word `var` to `val` on the first two variable declarations. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
object Main {
  def main(args: Array[String]): Unit = {
    val name = "Alice"
    val age = 30
    val city = "Paris"
    println(s"$name is $age in $city")
  }
}]], -- First two 'var's should be 'val'
                },
                feedback = "Test 3.2 complete!",
            },
             {
                instruction = "In this Clojure snippet, yank the s-expression `(println \"Hello\")` and paste it below the `(println \"World\")` line. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.3.3 (Clojure) ---
" Instruction: In this Clojure snippet, yank the s-expression `(println \"Hello\")` and paste it below the `(println \"World\")` line. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(defn greet []
  (println "Hello")
  (println "World"))
]],
                start_cursor = {6, 2}, -- Cursor on the first '('
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.3.3 (Clojure) ---
" Instruction: In this Clojure snippet, yank the s-expression `(println \"Hello\")` and paste it below the `(println \"World\")` line. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(defn greet []
  (println "Hello")
  (println "World")
  (println "Hello"))
]] -- The first println line should be duplicated below the second
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
                setup_text = [[
" --- Exercise 11.4.1 (Elixir) ---
" Instruction: In this Elixir snippet, use Line Visual (`V`) to select the three lines defining the function body and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
defmodule MyModule do
  def greet(name) do
    message = "Hello, #{name}"
    IO.puts(message)
  end
end]],
                start_cursor = {6, 2}, -- Cursor on 'm' of message
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.4.1 (Elixir) ---
" Instruction: In this Elixir snippet, use Line Visual (`V`) to select the three lines defining the function body and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
defmodule MyModule do
  def greet(name) do
  end
end]] -- The three lines of the function body should be gone
                },
                feedback = "Test 4.1 complete!",
            },
             {
                instruction = "In this Erlang snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the `case` expression. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.4.2 (Erlang) ---
" Instruction: In this Erlang snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the `case` expression. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
greet(Name) ->
    case Name of
        "Alice" -> io:format("Hello Alice~n");
        "Bob" -> io:format("Hello Bob~n");
        _ -> io:format("Hello Unknown~n")
    end.
]],
                start_cursor = {7, 8}, -- Cursor on the first space before "Alice"
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.4.2 (Erlang) ---
" Instruction: In this Erlang snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the `case` expression. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
greet(Name) ->
    case Name of
    "Alice" -> io:format("Hello Alice~n");
    "Bob" -> io:format("Hello Bob~n");
    _ -> io:format("Hello Unknown~n")
    end.
]] -- Leading spaces removed from the case branches
                },
                feedback = "Test 4.2 complete!",
            },
             {
                instruction = "In this F# snippet, change the word `let` to `mutable` on the first two variable declarations. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.4.3 (F#) ---
" Instruction: In this F# snippet, change the word `let` to `mutable` on the first two variable declarations. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
let name = "Alice"
let age = 30
let city = "London"
printfn "%s is %d in %s" name age city]],
                start_cursor = {5, 0}, -- Cursor on 'l' of the first 'let'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.4.3 (F#) ---
" Instruction: In this F# snippet, change the word `let` to `mutable` on the first two variable declarations. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
mutable name = "Alice"
mutable age = 30
let city = "London"
printfn "%s is %d in %s" name age city]] -- First two 'let's should be 'mutable'
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
                setup_text = [[
" --- Exercise 11.5.1 (TypeScript) ---
" Instruction: In this TypeScript snippet, use `:s` to replace all occurrences of `string` with `number` within the `interface` definition. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
interface User {
  id: string;
  name: string;
  email: string;
  age: number;
}]],
                start_cursor = {5, 0}, -- Cursor on the first line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.5.1 (TypeScript) ---
" Instruction: In this TypeScript snippet, use `:s` to replace all occurrences of `string` with `number` within the `interface` definition. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
interface User {
  id: number;
  name: number;
  email: number;
  age: number;
}]], -- All 'string's should be 'number'
                },
                feedback = "Test 5.1 complete!",
            },
             {
                instruction = "In this Vue snippet, use Line Visual (`V`) to select the lines inside the `<script>` block and delete them (`d`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.5.2 (Vue SFC) ---
" Instruction: In this Vue snippet, use Line Visual (`V`) to select the lines inside the `<script>` block and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<template>
  <div>{{ message }}</div>
</template>

<script>
export default {
  data() {
    return {
      message: 'Hello Vue!'
    }
  }
}
</script>

<style scoped>
div {
  color: blue;
}
</style>]],
                start_cursor = {8, 0}, -- Cursor on 'export default {'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.5.2 (Vue SFC) ---
" Instruction: In this Vue snippet, use Line Visual (`V`) to select the lines inside the `<script>` block and delete them (`d`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<template>
  <div>{{ message }}</div>
</template>

<script>
</script>

<style scoped>
div {
  color: blue;
}
</style>]] -- The content inside script tags should be gone
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
                setup_text = [[
" --- Exercise 11.6.1 (Assembly - NASM) ---
" Instruction: In this Assembly snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the `section .data`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
section .data
    msg db 'Hello, world!', 0xA
    len equ $ - msg

section .text
    global _start]],
                start_cursor = {6, 4}, -- Cursor on the first space of msg db
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.6.1 (Assembly - NASM) ---
" Instruction: In this Assembly snippet, use Block Visual (`<C-v>`) to delete the leading spaces on the lines within the `section .data`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
section .data
msg db 'Hello, world!', 0xA
len equ $ - msg

section .text
    global _start]] -- Leading spaces removed from msg and len lines
                },
                feedback = "Test 6.1 complete!",
            },
             {
                instruction = "In this C snippet, change the word `int` to `float` in the function signature. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.6.2 (C) ---
" Instruction: In this C snippet, change the word `int` to `float` in the function signature. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int main() {
    // ...
}]],
                start_cursor = {6, 0}, -- Cursor on 'i' of the first 'int'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.6.2 (C) ---
" Instruction: In this C snippet, change the word `int` to `float` in the function signature. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <stdio.h>

float add(int a, int b) {
    return a + b;
}

int main() {
    // ...
}]], -- The first 'int' should be 'float'
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
                setup_text = [[
" --- Exercise 11.7.1 (Fortran) ---
" Instruction: In this Fortran snippet, use `:s` to replace the first occurrence of `10` with `20` on the line containing `x = 10`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
PROGRAM Variables
  INTEGER :: x, y
  x = 10
  y = 20
  PRINT *, 'x = ', x
END PROGRAM Variables]],
                start_cursor = {7, 0}, -- Cursor on the line 'x = 10'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.7.1 (Fortran) ---
" Instruction: In this Fortran snippet, use `:s` to replace the first occurrence of `10` with `20` on the line containing `x = 10`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
PROGRAM Variables
  INTEGER :: x, y
  x = 20
  y = 20
  PRINT *, 'x = ', x
END PROGRAM Variables]] -- '10' should be '20' on the specified line
                },
                feedback = "Test 7.1 complete!",
            },
             {
                instruction = "In this COBOL snippet, use Line Visual (`V`) to select the two lines containing `DISPLAY` and `STOP RUN` and yank them (`y`). Then move to the line below `PROGRAM-ID. HELLOWORLD.` and paste them (`p`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.7.2 (COBOL) ---
" Instruction: In this COBOL snippet, use Line Visual (`V`) to select the two lines containing `DISPLAY` and `STOP RUN` and yank them (`y`). Then move to the line below `PROGRAM-ID. HELLOWORLD.` and paste them (`p`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.
       PROCEDURE DIVISION.
           DISPLAY 'Hello, World!'.
           STOP RUN.
]],
                start_cursor = {8, 7}, -- Cursor on the DISPLAY line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.7.2 (COBOL) ---
" Instruction: In this COBOL snippet, use Line Visual (`V`) to select the two lines containing `DISPLAY` and `STOP RUN` and yank them (`y`). Then move to the line below `PROGRAM-ID. HELLOWORLD.` and paste them (`p`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.
           DISPLAY 'Hello, World!'.
           STOP RUN.
       PROCEDURE DIVISION.
]] -- The DISPLAY and STOP RUN lines should be duplicated below PROGRAM-ID
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
                setup_text = [[
" --- Exercise 11.8.1 (Common Lisp) ---
" Instruction: In this Common Lisp snippet, change the word `defun` to `defmacro`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(defun greet (name)
  (format nil "Hello, ~a!" name))]],
                start_cursor = {5, 1}, -- Cursor on 'd' of defun
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.8.1 (Common Lisp) ---
" Instruction: In this Common Lisp snippet, change the word `defun` to `defmacro`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(defmacro greet (name)
  (format nil "Hello, ~a!" name))]] -- 'defun' should be 'defmacro'
                },
                feedback = "Test 8.1 complete!",
            },
             {
                instruction = "In this Prolog snippet, delete the line containing `ancestor(X, Y) :- parent(X, Y).`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.8.2 (Prolog) ---
" Instruction: In this Prolog snippet, delete the line containing `ancestor(X, Y) :- parent(X, Y).`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
]],
                start_cursor = {7, 0}, -- Cursor on the ancestor(X, Y) :- parent(X, Y). line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.8.2 (Prolog) ---
" Instruction: In this Prolog snippet, delete the line containing `ancestor(X, Y) :- parent(X, Y).`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
]] -- The specified ancestor line should be gone
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
                setup_text = [[
" --- Exercise 11.9.1 (Haskell) ---
" Instruction: In this Haskell snippet, change the word `x` to `a`, `y` to `b`, and `z` to `c`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
x = 10
y = 20
z = x + y]],
                start_cursor = {5, 0}, -- Cursor on 'x'
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.9.1 (Haskell) ---
" Instruction: In this Haskell snippet, change the word `x` to `a`, `y` to `b`, and `z` to `c`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
a = 10
b = 20
c = a + b]] -- x, y, z changed to a, b, c
                },
                feedback = "Test 9.1 complete!",
            },
             {
                instruction = "In this Scala snippet, use `:s` to replace the first occurrence of `println` with `printf` on the last line. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.9.2 (Scala) ---
" Instruction: In this Scala snippet, use `:s` to replace the first occurrence of `println` with `printf` on the last line. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
object Main {
  def main(args: Array[String]): Unit = {
    val name = "Alice"
    val age = 30
    val city = "Paris"
    println(s"$name is $age in $city")
  }
}]],
                start_cursor = {10, 4}, -- Cursor on the last line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.9.2 (Scala) ---
" Instruction: In this Scala snippet, use `:s` to replace the first occurrence of `println` with `printf` on the last line. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
object Main {
  def main(args: Array[String]): Unit = {
    val name = "Alice"
    val age = 30
    val city = "Paris"
    printf(s"$name is $age in $city")
  }
}]], -- println changed to printf on the last line
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
                setup_text = [[
" --- Exercise 11.10.1 (Clojure) ---
" Instruction: In this Clojure snippet, delete the line containing `(println \"Hello\")`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(defn greet []
  (println "Hello")
  (println "World"))]],
                start_cursor = {6, 2}, -- Cursor on the println "Hello" line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.10.1 (Clojure) ---
" Instruction: In this Clojure snippet, delete the line containing `(println \"Hello\")`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
(defn greet []
  (println "World"))]] -- The first println line should be gone
                },
                feedback = "Test 10.1 complete!",
            },
             {
                instruction = "In this Elixir snippet, change the word `greet` to `say_hello`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.10.2 (Elixir) ---
" Instruction: In this Elixir snippet, change the word `greet` to `say_hello`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
defmodule MyModule do
  def greet(name) do
    message = "Hello, #{name}"
    IO.puts(message)
  end
end]],
                start_cursor = {6, 6}, -- Cursor on 'g' of greet
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.10.2 (Elixir) ---
" Instruction: In this Elixir snippet, change the word `greet` to `say_hello`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
defmodule MyModule do
  def say_hello(name) do
    message = "Hello, #{name}"
    IO.puts(message)
  end
end]] -- 'greet' should be 'say_hello'
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
                setup_text = [[
" --- Exercise 11.11.1 (Erlang) ---
" Instruction: In this Erlang snippet, use `:s` to replace the first occurrence of `io:format` with `io:fwrite` on the first case branch. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
greet(Name) ->
    case Name of
        "Alice" -> io:format("Hello Alice~n");
        "Bob" -> io:format("Hello Bob~n");
        _ -> io:format("Hello Unknown~n")
    end.
]],
                start_cursor = {7, 8}, -- Cursor on the first case branch line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.11.1 (Erlang) ---
" Instruction: In this Erlang snippet, use `:s` to replace the first occurrence of `io:format` with `io:fwrite` on the first case branch. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
greet(Name) ->
    case Name of
        "Alice" -> io:fwrite("Hello Alice~n");
        "Bob" -> io:format("Hello Bob~n");
        _ -> io:format("Hello Unknown~n")
    end.
]] -- 'io:format' changed to 'io:fwrite' on the first branch
                },
                feedback = "Test 11.1 complete!",
            },
             {
                instruction = "In this F# snippet, use Line Visual (`V`) to select the two lines defining `name` and `age` and yank them (`y`). Then paste them below the `printfn` line (`p`). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.11.2 (F#) ---
" Instruction: In this F# snippet, use Line Visual (`V`) to select the two lines defining `name` and `age` and yank them (`y`). Then paste them below the `printfn` line (`p`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
let name = "Alice"
let age = 30
let city = "London"
printfn "%s is %d in %s" name age city]],
                start_cursor = {5, 0}, -- Cursor on the 'let name' line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.11.2 (F#) ---
" Instruction: In this F# snippet, use Line Visual (`V`) to select the two lines defining `name` and `age` and yank them (`y`). Then paste them below the `printfn` line (`p`). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
let name = "Alice"
let age = 30
let city = "London"
printfn "%s is %d in %s" name age city
let name = "Alice"
let age = 30]] -- The name and age lines should be duplicated below printfn
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
                setup_text = [[
" --- Exercise 11.12.1 (TypeScript) ---
" Instruction: In this TypeScript snippet, use Block Visual (`<C-v>`) to delete the semicolons `;` at the end of the interface properties. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
interface User {
  id: string;
  name: string;
  age: number;
}]],
                start_cursor = {6, 12}, -- Cursor on the ';' after id: string
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.12.1 (TypeScript) ---
" Instruction: In this TypeScript snippet, use Block Visual (`<C-v>`) to delete the semicolons `;` at the end of the interface properties. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
interface User {
  id: string
  name: string
  age: number
}]], -- Semicolons should be deleted
                },
                feedback = "Test 12.1 complete!",
            },
             {
                instruction = "In this Vue snippet, change the word `message` to `greeting` in the `<template>` block. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.12.2 (Vue SFC) ---
" Instruction: In this Vue snippet, change the word `message` to `greeting` in the `<template>` block. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<template>
  <div>{{ message }}</div>
</template>

<script>
// ...
</script>]],
                start_cursor = {6, 12}, -- Cursor on 'm' of message
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.12.2 (Vue SFC) ---
" Instruction: In this Vue snippet, change the word `message` to `greeting` in the `<template>` block. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
<template>
  <div>{{ greeting }}</div>
</template>

<script>
// ...
</script>]] -- 'message' should be 'greeting'
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
                setup_text = [[
" --- Exercise 11.13.1 (Assembly - NASM) ---
" Instruction: In this Assembly snippet, use `:s` to replace the first occurrence of `0xA` with `0xD, 0xA` on the line containing `msg db`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
section .data
    msg db 'Hello, world!', 0xA
    len equ $ - msg]],
                start_cursor = {6, 4}, -- Cursor on the msg db line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.13.1 (Assembly - NASM) ---
" Instruction: In this Assembly snippet, use `:s` to replace the first occurrence of `0xA` with `0xD, 0xA` on the line containing `msg db`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
section .data
    msg db 'Hello, world!', 0xD, 0xA
    len equ $ - msg]] -- '0xA' should be '0xD, 0xA'
                },
                feedback = "Test 13.1 complete!",
            },
             {
                instruction = "In this C snippet, yank the line containing `return a + b;` and paste it below the line containing `int main() {`. Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.13.2 (C) ---
" Instruction: In this C snippet, yank the line containing `return a + b;` and paste it below the line containing `int main() {`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int main() {
    // ...
}]],
                start_cursor = {7, 4}, -- Cursor on the return line
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.13.2 (C) ---
" Instruction: In this C snippet, yank the line containing `return a + b;` and paste it below the line containing `int main() {`. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------
#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int main() {
    return a + b;
    // ...
}]] -- The return line should be duplicated below int main() {
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
                setup_text = [[
" --- Exercise 11.14.1 ---
" Instruction: Insert text to complete the sentence: 'You have successfully completed the LearnVim tutorial!'. Place your cursor after 'You have successfully completed the ' and insert 'LearnVim tutorial!'. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

You have successfully completed the .]],
                start_cursor = {5, 35}, -- Cursor after "the "
                validation = {
                    type = 'check_buffer_content',
                    target_content = [[
" --- Exercise 11.14.1 ---
" Instruction: Insert text to complete the sentence: 'You have successfully completed the LearnVim tutorial!'. Place your cursor after 'You have successfully completed the ' and insert 'LearnVim tutorial!'. Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

You have successfully completed the LearnVim tutorial!.]] -- Sentence should be complete
                },
                feedback = "Almost there! Now for the final message.",
            },
             {
                instruction = "Replace the placeholder text `[Your Name]` with your name and `[Your Effort]` with a word describing your effort (e.g., 'great', 'hard'). Type `:LearnVim exc` to check.",
                type = "insert_text", -- Check buffer content
                setup_text = [[
" --- Exercise 11.14.2 ---
" Instruction: Replace the placeholder text `[Your Name]` with your name and `[Your Effort]` with a word describing your effort (e.g., 'great', 'hard'). Type `:LearnVim exc` to check.
" Use `:LearnVim exc` to check, `:LearnVim exr` to reset.
" ---------------------------------------------

Congratulations, [Your Name]! Your [Your Effort] work learning Vim has paid off. You've mastered the basics and are well on your way to becoming a Vim expert!]],
                start_cursor = {5, 17}, -- Cursor on '[' of [Your Name]
                validation = {
                    type = 'check_buffer_content_regex', -- Need regex validation
                    target_content_pattern = [[^" --- Exercise 11\.14\.2 ---\n" Instruction: Replace the placeholder text `\[Your Name\]` with your name and `\[Your Effort\]` with a word describing your effort \(e\.g\., 'great', 'hard'\)\. Type `:LearnVim exc` to check\.\n" Use `:LearnVim exc` to check, `:LearnVim exr` to reset\.\n" ---------------------------------------------\n\nCongratulations, .+! Your .+ work learning Vim has paid off\. You've mastered the basics and are well on your way to becoming a Vim expert!$]], -- Regex to check for non-empty replacements
                },
                feedback = "Congratulations on completing the LearnVim tutorial!",
                -- TODO: Implement 'check_buffer_content_regex' validation type.
            },
        },
    },
    -- End of Module 11
}

