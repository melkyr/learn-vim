LearnVim.nvim

An interactive tutorial plugin for Neovim to help users learn Vim's modal editing and basic commands directly within the editor.
Table of Contents

    About

    Installation

    Usage

    Curriculum

    Contributing

    License

About

LearnVim.nvim provides a structured, interactive way to learn the fundamentals of Vim's modal editing paradigm and essential commands without leaving your Neovim environment. It splits your window into a tutorial pane (explaining concepts) and an exercise pane (where you practice). Progress is saved automatically.
Installation

Install using your favorite Neovim package manager.

lazy.nvim

Add this to your plugins/ directory or your init.lua:

{ 'melkyr/learn-vim.nvim' } -- Replace 'your_github_username' with your GitHub username

Packer

Add this to your init.lua:

use 'melkyr/learn-vim.nvim' -- Replace 'your_github_username' with your GitHub username

vim-plug

Add this to your init.vim or init.lua:

Plug 'melkyrlearn-vim.nvim' " Replace 'your_github_username' with your GitHub username

After adding the plugin, run the appropriate command for your package manager to install it (e.g., :Lazy sync, :PackerSync, :PlugInstall).
Usage

The primary way to interact with the tutorial is through the :LearnVim command.

    :LearnVim start: Start or resume the tutorial. This will split your current window into the tutorial and exercise panes.

    :LearnVim next: Move to the next exercise or lesson.

    :LearnVim prev: Move to the previous lesson.

    :LearnVim lesson <module>.<lesson>: Jump to a specific lesson (e.g., :LearnVim lesson 1.3).

    :LearnVim exc: Check if you have completed the current exercise correctly.

    :LearnVim exr: Reset the current exercise to its initial state.

    :LearnVim restart: Reset your tutorial progress to the beginning (Module 1, Lesson 1) and restart the tutorial.

Example Workflow:

    Open Neovim.

    Type :LearnVim start and press <Enter>.

    Read the instructions in the top (tutorial) pane.

    Perform the required actions in the bottom (exercise) pane.

    Type :LearnVim exc and press <Enter> to check your work.

    If correct, the tutorial will advance. If not, try again or use :LearnVim exr to reset.

    Use :LearnVim next or :LearnVim prev to navigate manually if needed.

    Type :qall to exit Neovim when you're done. Your progress is saved automatically.

Curriculum

The plugin currently includes:

    Module 1: The Vim Mindset & Survival Basics

        Modal Editing Explained

        Entering Normal Mode (<Esc>)

        Entering Insert Mode (i)

        Append (a)

        Saving (:w)

        Quitting (:q!, :wq, :x)

    Module 2: Basic Navigation (The Home Row)

        Moving Left and Right (h, l)

        Moving Down and Up (j, k)

        Combining Basic Movements

More modules and lessons are planned for the future!
Contributing

Contributions are welcome! If you find a bug, have a suggestion for a new lesson, or want to improve the code, please open an issue or submit a pull request on the GitHub repository.
License

This project is licensed under the MIT License - see the LICENSE file for details.
