# LearnVim.nvim

An interactive tutorial plugin for Neovim to help users learn Vim's modal editing and basic commands directly within the editor.

---

## 📚 About

**LearnVim.nvim** provides a structured, interactive way to learn the fundamentals of Vim's modal editing paradigm and essential commands without leaving your Neovim environment. It splits your window into a tutorial pane (explaining concepts) and an exercise pane (where you practice). Progress is saved automatically.

---

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

- **Normal Mode**: Navigation, editing, and command usage
- **Insert Mode**: Inserting and appending text
- **Visual Mode**: Selecting and manipulating text TODO
- **Command-Line Mode**: Executing commands and searches TODO
- **Registers**: Understanding and using Vim registers TODO
- **Macros**: Recording and playing back sequences TODO
- **Undo/Redo**: Managing changes TODO
- **Buffers, Windows, and Tabs**: Working with multiple files and views TODO
- **Search and Replace**: Finding and modifying text TODO
- **Customizing Vim**: Introduction to `.vimrc` and basic configurations TODO

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
