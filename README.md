# LearnVim.nvim

An interactive tutorial plugin for Neovim to help users learn Vim's modal editing and basic commands directly within the editor.

---

## 📚 About

**LearnVim.nvim** provides a structured, interactive way to learn the fundamentals of Vim's modal editing paradigm and essential commands without leaving your Neovim environment. It splits your window into a tutorial pane (explaining concepts) and an exercise pane (where you practice). Progress is saved automatically.

---
## ✨ Motivation and Comparison

Learning Vim can feel daunting at first due to its modal nature and vast command set. While resources like the built-in `vimtutor` and various books are invaluable, they often require switching contexts or don't fully leverage the interactive capabilities of the editor itself.

* **`vimtutor`**: Excellent for a quick, basic introduction, but limited in scope and structure. It's a single, linear experience without persistent progress or modular lessons.

* **Books/Online Guides**: Provide in-depth knowledge but require reading outside the editor you're trying to learn, making immediate practice less seamless.

**LearnVim.nvim** aims to bridge this gap by offering:

* **Integrated Experience**: Learn and practice directly within your Neovim instance, using the actual environment you'll be working in.

* **Structured Curriculum**: Progress through modules and lessons covering core concepts systematically.

* **Interactive Exercises**: Hands-on practice in a dedicated pane, with validation to check your understanding.

* **Persistent Progress**: Pick up where you left off across Neovim sessions.

* **Modular Design**: Easily add or modify lessons and modules.

This plugin is designed to be a stepping stone, providing a guided, practical introduction that complements other resources and helps build muscle memory for common Vim tasks in a real editing environment.



## ⚙️ Installation

Install using your favorite Neovim package manager.

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add this to your plugins list in `init.lua`:

```lua
{ 'melkyr/learn-vim.nvim' }
```

### Using [Packer](https://github.com/wbthomason/packer.nvim)

Add this to your plugins list in `init.lua`:

```lua
use 'melkyr/learn-vim.nvim'
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

Add this to your `init.vim` or `init.lua`:

```vim
Plug 'melkyr/learn-vim.nvim'
```

After adding the plugin, run the appropriate command for your package manager to install it:

- `:Lazy sync`
- `:PackerSync`
- `:PlugInstall`

---

## 🚀 Usage

The primary way to interact with the tutorial is through the `:LearnVim` command.

---

## 🧠 Curriculum (In Progress)

The tutorial covers the following topics:
Module 1: Introduction to Vim

    What is Vim?
    Modal Editing
    Normal Mode
    Insert Mode (i)
    Command-line Mode (:)
    Saving (:w) and Quitting (:q, :wq, :q!)

Module 2: Basic Movements

    Character Movements (h, j, k, l)
    Word Movements (w, b, e)
    Line Movements (0, ^, $)

Module 3: Counts and Repetition

    Repeating the Last Change (.)
    Undo (u) and Redo (<C-r>)
    Combining Counts with Movements

Module 4: Deletion and Changing

    Deleting Text (d)
    Changing Text (c)
    Deleting Lines (dd)
    Changing Lines (cc)
    Combining Deletion/Changing with Movements

Module 5: Yanking and Putting

    Yanking (Copying) Text (y)
    Putting (Pasting) Text (p, P)
    Yanking Lines (yy)
    Combining Yanking with Movements

Module 6: More Insertion Modes

    Insert at Beginning of Line (I)
    Append at End of Line (A)
    Open Line Below (o)
    Open Line Above (O)

Module 7: Finding, Searching, and Replacing

    Character Finding on a Line (f, F, t, T, ;, ,)
    Basic Searching (/, ?, n, N)
    Combining Counts with Find/Search
    Simple Find and Replace (:s)
    Search Highlighting (:set hlsearch, :nohlsearch)

Module 8: Command-line Mode and Registers

    Introduction to Command-line Mode (:)
    Ranges with Commands (:1,5, :.,$, :%, :g/pattern/)
    Introduction to Registers (", named registers a-z)
    Special Registers (", 0, %, #, :, /, .)
    The Black Hole Register (_)
    The Selection and Clipboard Registers (*, +)
    Testing System Clipboard Integration

Module 9: Advanced Editing and Navigation

    Multiline Visual Editing (V, <C-v>)
    Repeating Multiline Actions (.)
    Matching Braces/Brackets/Parentheses (%)
    Applying Actions with % (e.g., d%, c%, y%)

Module 10: Macros

    Recording Macros (q)
    Playing Back Macros (@, counts with @)
    Macros for Repetitive Editing (Parts 1-6, with various languages)

Module 11: Final Test

    Mixed exercises testing skills from previous modules, using various programming languages.
    Congratulatory message and ASCII art.

Module 12: Buffers, Windows, and Tabs

    Introduction to Buffers, Windows, and Tabs
    Navigating Buffers (:ls, :bnext, :bprev, :buffer, :bd)
    Splitting Windows (:split, :vsplit)
    Navigating Windows (<C-w> h/j/k/l/w/W/c/q)
    Working with Tabs (:tabnew, :tabnext, :tabprev, :tabclose, :tabonly, {number}gt)
    Combining Buffers, Windows, and Tabs

Module 13: Text Objects

    Introduction to Text Objects (i, a)
    Sentence and Paragraph Objects (s, p)
    Delimiter Objects ((), [], {} etc., ", ', ```)
    Combining Operators with Text Objects (d, c, y, v)

Module 14: Customizing Vim

    Your Vim Configuration File (~/.vimrc, init.lua, init.vim, $MYVIMRC)
    Setting Options (:set, vim.opt)
    Creating Mappings (:map, :noremap, modes)
    The Leader Key (<leader>)
    Using <Plug>
    Exploring Options and Colors (:h, :highlight, vim.api.nvim_set_hl)
    Congratulatory message and ASCII art (End of Tutorial)

---

## 🤝 Contributing

Contributions are welcome! If you'd like to improve the tutorial, fix bugs, or add new features, please:

1. Fork the repository
2. Create a new branch for your feature or fix
3. Commit your changes with clear messages
4. Push to your fork and submit a pull request

Please ensure your code follows the existing style and includes relevant tests or documentation.

---

## 📄 License

This project is licensed under the [APACHE 2.0 License](LICENSE).

---

Happy Vimming! 🎉
