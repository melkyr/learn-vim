-- lua/learn_vim/modules/module13.lua
-- lua/learn_vim/locales/en/modules/module14.lua

-- This file contains the content for Module 14: Customizing Vim.
-- It introduces configuration files, mappings, and options.

local Utils = require('learn_vim.utils')
local Locale = require('learn_vim.locale')
local lang = Locale.get_language()

local function get_exercise_path(filename)
    return "lua/learn_vim/locales/" .. lang .. "/exercise_content/" .. filename
end

return {
    title = "Customizing Vim",
    lesson1 = {
        title = "Your Vim Configuration File",
        explanation = [[
Welcome to Module 14, Lesson 14.1!

Vim and Neovim are highly customizable. Your personal settings and configurations are stored in a configuration file.

* In traditional Vim, this file is typically `~/.vimrc`.
* In Neovim, the primary configuration is often in Lua, located at `~/.config/nvim/init.lua`. You can also still use Vimscript in `~/.config/nvim/init.vim`.

This file is executed every time Vim/Neovim starts. You can place commands here just as you would type them on the command line (without the leading `:`).

Let's open your configuration file. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Type `:e $MYVIMRC` and press <Enter> to open your main Neovim configuration file (init.lua or init.vim). Explore the file if it exists. Type `:LearnVim exc` to check.",
                type = "command", -- We'll check if the command was likely executed
                target_command = ":e $MYVIMRC",
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson1_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You opened your configuration file!",
                 -- Note: We can't validate *which* file was opened or its content easily.
            },
        },
    },
    lesson2 = {
        title = "Setting Options (`:set`, vim.opt`)",
        explanation = [[
Welcome to Lesson 14.2!

You've already used commands like `:set number` to change Vim's behavior. These are called **options**. Options control everything from how text is displayed to how Vim interacts with files.

You can set options:
* Temporarily on the command line (e.g., `:set nonumber`).
* Permanently in your configuration file (e.g., `set number` in Vimscript or `vim.opt.number = true` in Lua).

Experiment with changing some options!

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Type `:set wrap` and press <Enter> to turn on line wrapping in the exercise pane. Then type `:set nowrap` and press <Enter> to turn it off. Type `:LearnVim exc` to check.",
                type = "command", -- Check mode
                target_command = ":set nowrap",
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson2_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You experimented with line wrapping!",
                 -- TODO: Add validation to check option values, if possible.
            },
             {
                instruction = "If you are using Neovim with a Lua config, open your init.lua (`:e $MYVIMRC`). Add the line `vim.opt.relativenumber = true` somewhere in the file. Save the file (`:w`). Close and reopen Neovim to see the change. Type `:LearnVim exc` to check.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson2_exercise2_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You modified your configuration file!",
                 -- Note: Cannot validate external file changes or restart effects.
            },
        },
    },
    lesson3 = {
        title = "Creating Mappings (`:map`, `:noremap`)",
        explanation = [[
Welcome to Lesson 14.3!

One of the most powerful customization features is creating your own **mappings**. Mappings allow you to execute complex commands or sequences of keystrokes with a simple key press.

Basic mapping commands:
* **`:map {lhs} {rhs}`**: Maps the left-hand side `{lhs}` to the right-hand side `{rhs}` in the current mode. Mappings are recursive (meaning `{rhs}` can trigger other mappings).
* **`:noremap {lhs} {rhs}`**: Similar to `:map`, but non-recursive. This is generally preferred to avoid unexpected behavior from other mappings.

You can specify modes:
* **`:nmap`** / **`:nnoremap`**: Normal mode
* **`:vmap`** / **`:vnoremap`**: Visual mode
* **`:imap`** / **`:inoremap`**: Insert mode
* **`:cmap`** / **`:cnoremap`**: Command-line mode
* **`:omap`** / **`:onoremap`**: Operator-pending mode

Example: `:nnoremap <Space> :noh<CR>` maps the Space key in Normal mode to clear search highlighting (`:noh`) and press Enter (`<CR>`).

Let's practice creating a simple mapping. Use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Type `:nnoremap <F2> :set nonumber<CR>` and press <Enter> to map the F2 key to turn off line numbers. Press F2 to test it. Type `:LearnVim exc` to check.",
                type = "command", -- Check mode
                target_command = ":nnoremap <F2> :set nonumber<CR>",
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson3_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You created a mapping!",
                 -- Note: Cannot validate the mapping itself or if it works.
            },
        },
    },
    lesson4 = {
        title = "The Leader Key (`<leader>`)",
        explanation = [[
Welcome to Lesson 14.4!

To avoid conflicting with Vim's built-in commands, it's common practice to define custom mappings using a **leader key**. The leader key is a key (or sequence of keys) that you press before your custom mapping.

The default leader key is `\`, but you can change it in your configuration file:
* `let mapleader = ','` (Vimscript)
* `vim.g.mapleader = ','` (Lua)

Once set, you can define mappings relative to the leader key:
* `:nnoremap <leader>w :w<CR>` maps `,w` (if leader is `,`) to save the file.
* `:nnoremap <leader>n :nohlsearch<CR>` maps `,n` to clear search highlighting.

Using `<leader>` keeps your custom mappings organized and out of the way of standard Vim commands.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "If you are using Neovim with a Lua config, open your init.lua (`:e $MYVIMRC`). Add the line `vim.g.mapleader = ','` to set your leader key to comma. Save the file (`:w`). Close and reopen Neovim. Then come back to this lesson and type `:nnoremap <leader>t :tabnew<CR>` to map your leader key followed by 't' to create a new tab. Type `:LearnVim exc` to check.",
                type = "command", -- Check mode
                target_command = ":nnoremap <leader>t :tabnew<CR>",
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson4_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You created a leader mapping!",
                 -- Note: Cannot validate external file changes or the mapping itself.
            },
        },
    },
    lesson5 = {
        title = "Using <Plug>",
        explanation = [[
Welcome to Lesson 14.5!

Sometimes plugin authors create mappings that are not meant to be used directly but are instead targets for *your* mappings. This is done using the special `<Plug>` keycode.

`<Plug>` mappings prevent the mapping from being triggered recursively or by other mappings unless explicitly mapped using `<Plug>`. This is a way for plugins to expose functionality that you can then map to your preferred keys, often using your `<leader>`.

You'll typically see this in plugin documentation:
`nnoremap <leader>gf <Plug>(plugin-feature)`

Here, `<Plug>(plugin-feature)` is an internal mapping provided by the plugin. Your mapping `<leader>gf` calls this internal mapping. This allows you to customize the keybinding (`<leader>gf`) without needing to know the internal workings of the plugin's feature.

This lesson is purely informative; there's no exercise to perform here, as `<Plug>` is used for integrating with external plugins.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Read the explanation about `<Plug>`. This lesson is informative and does not require a specific action in the exercise pane. Type `:LearnVim exc` to continue.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson5_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You learned about <Plug>!",
            },
        },
    },
    lesson6 = {
        title = "Exploring Options and Colors",
        explanation = [[
Welcome to Lesson 14.6!

There are hundreds of options in Vim/Neovim! You can explore them using the help system (`:h option-list` or `:h 'option_name'`).

You can also change the appearance of Vim, including colors. While complex color schemes involve dedicated files, you can change basic highlighting groups:
* `:highlight {group} {key}={value} ...` (Vimscript)
* `vim.api.nvim_set_hl(0, '{group}', { {key} = {value}, ... })` (Lua)

For example, to change the color of line numbers:
* `:highlight LineNr guifg=yellow guibg=blue` (Vimscript - for GUI/terminals with color support)
* `vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ffff00', bg = '#0000ff' })` (Lua)

The best way to learn about options and colors is to experiment! Change an option, see what happens. Change a highlight group. If you don't like it, you can often revert it with `:set {option}&` or by closing and reopening Vim.

Remember: You can always undo your text edits with `u`. For command-line actions or option changes, closing and reopening Vim/Neovim (unless you saved the change to your config file) will revert them to your default settings.

Remember to use `:LearnVim exc` to check and `:LearnVim exr` to reset.
]],
        exercises = {
            {
                instruction = "Type `:set cursorline` and press <Enter> to highlight the current line. Then type `:set cursorline&` and press <Enter> to revert it to its default. Type `:LearnVim exc` to check.",
                type = "command", -- Check mode
                target_command = ":set cursorline&",
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson6_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You experimented with an option!",
                 -- Note: Cannot validate option state reliably.
            },
             {
                instruction = "Type `:highlight Normal guibg=red` and press <Enter> to change the background color of normal text (this might affect the tutorial pane!). Then type `:highlight Normal guibg=NONE` and press <Enter> to reset it. Type `:LearnVim exc` to check.",
                type = "command", -- Check mode
                target_command = ":highlight Normal guibg=NONE",
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson6_exercise2_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "You experimented with highlight colors!",
                 -- Note: Cannot validate highlight groups reliably.
            },
        },
    },
    lesson7 = {
        title = "Congratulations!",
        explanation = [[
Welcome to Lesson 14.7!

You have reached the end of the LearnVim tutorial!

You've put in the effort to learn the fundamentals of a incredibly powerful text editor. From basic movements and edits to visual mode, macros, and navigating buffers, windows, and tabs – you've built a solid foundation.

Mastering Vim is a journey, and this tutorial is just the beginning. There's always more to learn, more commands to discover, and more ways to refine your workflow.

Keep practicing! The more you use Vim, the more natural it will feel, and the faster and more efficient you will become.

Consider sharing this plugin with friends or colleagues who are interested in learning Vim.

Now, go forth and edit with power! Explore Neovim's excellent built-in help (`:h`), check out other plugins, and continue your Vim journey!

Thank you for using LearnVim!
]],
        exercises = {
            {
                instruction = "Read the congratulatory message. You've completed the tutorial! Type `:LearnVim exc` to finish this lesson and the module.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson7_exercise1_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "Tutorial complete! Congratulations!",
            },
             {
                instruction = "Here is a small ASCII art Ace of Spades as a token of your mastery. You don't need to do anything with it. Type `:LearnVim exc` to finish this exercise.",
                type = "mode_switch", -- Check mode
                setup_text = Utils.read_file_content(get_exercise_path("module14_lesson7_exercise2_setup.txt")),
                start_cursor = {5, 0},
                validation = { type = 'check_mode', target_mode = 'n' }, -- Basic validation
                feedback = "Enjoy your Ace of Spades!",
            },
        },
    },
    -- End of Module 14
}

