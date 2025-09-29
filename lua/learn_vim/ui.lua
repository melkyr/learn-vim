-- lua/learn_vim/ui.lua

-- This module handles creating, updating, and managing the tutorial windows and buffers.
-- It is structured as a function that is called with the parent module (M) from init.lua.

return function(M) -- Accept the parent module M as an argument
    local M_ui = {} -- Local module table for UI functions
    local Contents = require('learn_vim.contents') -- Require the contents module
    local Utils = require('learn_vim.utils') -- Require the utils module

    --- UI Setup ---
    -- Creates or finds the tutorial buffers and windows.
    -- Ensures the UI is in a consistent state.
    -- This version replaces the current window with the exercise pane,
    -- then splits it ONCE using a HORIZONTAL split for the tutorial pane.
    function M_ui.setup_tutorial_ui()
        -- Options for the tutorial text buffer (initially modifiable for setup)
         local tutorial_buf_opts = {
            listed = false,     -- Don't show in :ls
            scratch = true,     -- Don't associate with a file on disk
            bufhidden = 'hide', -- Hide buffer when its last window is closed
            swapfile = false,   -- Don't create a swap file for this buffer
            -- Initially modifiable, will be set to readonly/unmodifiable below
            modifiable = true,
            readonly = false,
        }
        -- Options for the exercise buffer (interactive, initially modifiable)
         local exercise_buf_opts = {
            listed = false, scratch = true, bufhidden = 'hide', swapfile = false,
            modifiable = true, -- Always modifiable initially for setup
            readonly = false,
         }

        -- Check if the tutorial buffer is valid. If not, create it.
        if not vim.api.nvim_buf_is_valid(M.current_state.tutorial_bufnr) then
            M.current_state.tutorial_bufnr = vim.api.nvim_create_buf(false, tutorial_buf_opts)
            vim.api.nvim_buf_set_name(M.current_state.tutorial_bufnr, '[LearnVim Tutorial]')
        end

        -- Check if the exercise buffer is valid. If not, create it.
        if not vim.api.nvim_buf_is_valid(M.current_state.exercise_bufnr) then
            M.current_state.exercise_bufnr = vim.api.nvim_create_buf(false, exercise_buf_opts)
             vim.api.nvim_buf_set_name(M.current_state.exercise_bufnr, '[LearnVim Exercise]')
        end

        -- Check if the tutorial and exercise windows are currently valid.
        local tutorial_win_valid = M.current_state.tutorial_winid ~= -1 and vim.api.nvim_win_is_valid(M.current_state.tutorial_winid)
        local exercise_win_valid = M.current_state.exercise_winid ~= -1 and vim.api.nvim_win_is_valid(M.current_state.exercise_winid)

        -- If either window is not valid, close any invalid ones and create new splits.
        if not tutorial_win_valid or not exercise_win_valid then
            -- Close invalid windows using pcall to avoid errors if they're already gone
            if tutorial_win_valid then pcall(vim.api.nvim_win_close, M.current_state.tutorial_winid, true) end
            if exercise_win_valid then pcall(vim.api.nvim_win_close, M.current_state.exercise_winid, true) end

            -- Get the current window. This is the window that will become the exercise pane.
            local current_win = vim.api.nvim_get_current_win()

            -- Set the exercise buffer into the current window. This replaces its content.
            vim.api.nvim_win_set_buf(current_win, M.current_state.exercise_bufnr)
            M.current_state.exercise_winid = current_win -- Store the ID of the now-exercise window

            -- Split the current window (which is now the exercise window) HORIZONTALLY.
            -- This creates the space for the tutorial window above it.
            vim.cmd('split') -- Changed from 'vsplit' to 'split'
            -- The new window created by split is now the current window.
            M.current_state.tutorial_winid = vim.api.nvim_get_current_win()
            -- Set the tutorial buffer into this new window.
            vim.api.nvim_win_set_buf(M.current_state.tutorial_winid, M.current_state.tutorial_bufnr)


            -- Set window options for cleanliness and usability in the tutorial panes.
            -- Tutorial window options (top pane)
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'wrap', true)
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'number', false)
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'relativenumber', false)
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'signcolumn', 'no')
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'foldcolumn', '0')
            vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'winfixheight', true)
            vim.api.nvim_win_set_height(M.current_state.tutorial_winid, 10)


            -- Exercise window options (bottom pane - the original window)
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'wrap', false)
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'number', true)
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'relativenumber', false)
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'signcolumn', 'no')
            vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'foldcolumn', '0')


            -- Return focus to the exercise window so the user can start interacting.
             vim.api.nvim_set_current_win(M.current_state.exercise_winid)
        else
             -- Windows were already valid. Ensure correct buffers are assigned
             vim.api.nvim_win_set_buf(M.current_state.tutorial_winid, M.current_state.tutorial_bufnr)
             vim.api.nvim_win_set_buf(M.current_state.exercise_winid, M.current_state.exercise_bufnr)

              -- Ensure buffer options are correct
            Utils.set_buffer_options(M.current_state.tutorial_bufnr, {
                readonly = true,
                modifiable = false,
                wrap = true,
                bufhidden = 'hide'
            })
            Utils.set_buffer_options(M.current_state.exercise_bufnr, {
                modifiable = true,
                readonly = false,
                wrap = false,
                bufhidden = 'hide'
            })

             -- Return focus to the exercise window
             vim.api.nvim_set_current_win(M.current_state.exercise_winid)
        end

        -- Re-apply key window options every time setup is called
        vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'winfixheight', true)
        vim.api.nvim_win_set_height(M.current_state.tutorial_winid, 10)
        vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'number', true)
        vim.api.nvim_win_set_option(M.current_state.tutorial_winid, 'wrap', true)
        vim.api.nvim_win_set_option(M.current_state.exercise_winid, 'wrap', false)
    end

    --- Display Lesson Content ---
    function M_ui.display_lesson(module_id, lesson_id)
        local lesson_data = M.curriculum['module' .. module_id] and M.curriculum['module' .. module_id]['lesson' .. lesson_id]
        if not lesson_data then
            vim.notify("Error: Lesson data not found for " .. module_id .. "." .. lesson_id, vim.log.levels.ERROR)
            return
        end

        M_ui.setup_tutorial_ui()

        local tutorial_buf = M.current_state.tutorial_bufnr
        Utils.set_buffer_options(tutorial_buf, {modifiable = true}) -- Ensure modifiable before writing
        vim.api.nvim_buf_set_lines(tutorial_buf, 0, -1, false, {})
        local explanation_lines = vim.split(lesson_data.explanation, '\n', { plain = true })
        vim.api.nvim_buf_set_lines(tutorial_buf, 0, 0, false, explanation_lines)
        Utils.set_buffer_options(tutorial_buf, {
            modifiable = false,
            readonly = true,
            bufhidden = 'hide',
            wrap = true
        })
        vim.api.nvim_win_set_cursor(M.current_state.tutorial_winid, {1, 0})

        local exercise_buf = M.current_state.exercise_bufnr
        Utils.set_buffer_options(exercise_buf, {
            modifiable = true,
            readonly = false,
            wrap = false
        })
        vim.api.nvim_buf_set_lines(exercise_buf, 0, -1, false, {})

        if lesson_data.exercises and #lesson_data.exercises > 0 then
            local current_exercise = lesson_data.exercises[M.current_state.exercise]
            if not current_exercise then
                 vim.notify("Error: Exercise index " .. M.current_state.exercise .. " not found for lesson " .. module_id .. "." .. lesson_id, vim.log.levels.ERROR)
                 local no_exercise_lines = {
                    "--- Error Loading Exercise ---", "",
                    "Could not find exercise " .. M.current_state.exercise .. ".",
                    "Please report this bug or try :LearnVim next",
                 }
                 Utils.set_buffer_options(exercise_buf, {modifiable = true})
                 vim.api.nvim_buf_set_lines(exercise_buf, 0, 0, false, no_exercise_lines)
                 Utils.set_buffer_options(exercise_buf, {
                    modifiable = false,
                    readonly = true,
                    bufhidden = 'hide',
                    wrap = false
                 })
                 vim.api.nvim_set_current_win(M.current_state.tutorial_winid)
                 return
            end

            if current_exercise.setup_text then
                local setup_lines = vim.split(current_exercise.setup_text, '\n', { plain = true })
                Utils.set_buffer_options(exercise_buf, {modifiable = true})
                vim.api.nvim_buf_set_lines(exercise_buf, 0, 0, false, setup_lines)
                 if current_exercise.start_cursor then
                     vim.api.nvim_win_set_cursor(M.current_state.exercise_winid, current_exercise.start_cursor)
                 else
                       vim.api.nvim_win_set_cursor(M.current_state.exercise_winid, {1, 0})
                 end
            else
                 local instruction_lines = {
                    '" --- Exercise ' .. module_id .. '.' .. lesson_id .. '.' .. M.current_state.exercise .. ' ---',
                    '" Instruction: ' .. current_exercise.instruction,
                    '" Use \':LearnVim exc\' to check, \':LearnVim exr\' to reset.',
                    '" ---------------------------------------------', '',
                }
                 Utils.set_buffer_options(exercise_buf, {modifiable = true})
                 vim.api.nvim_buf_set_lines(exercise_buf, 0, 0, false, instruction_lines)
                 vim.api.nvim_win_set_cursor(M.current_state.exercise_winid, {5, 0})
            end

            Utils.set_buffer_options(exercise_buf, {
                modifiable = true,
                readonly = false,
                bufhidden = 'hide',
                wrap = false
            })
            vim.api.nvim_set_current_win(M.current_state.exercise_winid)
        else
            local no_exercise_lines = {
                "--- No Exercise ---", "",
                "This lesson was informational.",
                "Type :LearnVim next to continue.",
            }
            Utils.set_buffer_options(exercise_buf, {modifiable = true})
            vim.api.nvim_buf_set_lines(exercise_buf, 0, 0, false, no_exercise_lines)
            Utils.set_buffer_options(exercise_buf, {
                modifiable = false,
                readonly = true,
                bufhidden = 'hide',
                wrap = false
            })
            vim.api.nvim_set_current_win(M.current_state.tutorial_winid)
            vim.notify("Lesson " .. module_id .. "." .. lesson_id .. " loaded. No exercises.", vim.log.levels.INFO)
        end
    end

    --- Display Contents Menu ---
    function M_ui.display_contents_menu()
        local menu_items = Contents.get_menu_items()
        local prepared_lines = {}
        local max_width = 0

        for _, item in ipairs(menu_items) do
            table.insert(prepared_lines, item.display_text)
            if #item.display_text > max_width then
                max_width = #item.display_text
            end
        end

        local screen_width = vim.api.nvim_get_option_value('columns', {})
        local screen_height = vim.api.nvim_get_option_value('lines', {})
        local win_width = math.min(math.max(max_width + 4, 40), screen_width - 4)
        local win_height = math.min(#prepared_lines + 2, screen_height - 4)
        local row = math.floor((screen_height - win_height) / 2)
        local col = math.floor((screen_width - win_width) / 2)

        local menu_bufnr = vim.api.nvim_create_buf(false, true)
        local win_opts = {
            relative = 'editor', style = 'minimal', border = 'rounded',
            width = win_width, height = win_height, row = row, col = col,
            focusable = true, zindex = 50
        }
        
        local menu_winid = vim.api.nvim_open_win(0, true, win_opts) 
        vim.api.nvim_win_set_buf(menu_winid, menu_bufnr)

        Utils.set_buffer_options(menu_bufnr, {
            bufhidden = 'wipe',
            buftype = 'nofile',
            modifiable = false, -- Set initially non-modifiable
            wrap = false,
            buflisted = false,
            swapfile = false,
            cursorline = true
        })

        Utils.set_buffer_options(menu_bufnr, {modifiable = true}) -- Allow modification for setting lines
        vim.api.nvim_buf_set_lines(menu_bufnr, 0, -1, false, prepared_lines)
        Utils.set_buffer_options(menu_bufnr, {modifiable = false}) -- Set back to non-modifiable

        -- Keymaps
        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', 'q', '', {
            noremap = true, silent = true,
            callback = function()
                if vim.api.nvim_win_is_valid(menu_winid) then
                    vim.api.nvim_win_close(menu_winid, true)
                end
            end
        })
        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', '<CR>', '', {
            noremap = true, silent = true,
            callback = function()
                local cursor_pos = vim.api.nvim_win_get_cursor(menu_winid)
                local line_num = cursor_pos[1]
                local selected_item = menu_items[line_num] 
                if selected_item and selected_item.type == "lesson_item" then
                    if vim.api.nvim_win_is_valid(menu_winid) then
                        vim.api.nvim_win_close(menu_winid, true)
                    end
                    M.navigation.goto_lesson(selected_item.module_num, selected_item.lesson_num)
                end
            end
        })
        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', '<Esc>', '', {
            noremap = true, silent = true,
            callback = function()
                if vim.api.nvim_win_is_valid(menu_winid) then
                    vim.api.nvim_win_close(menu_winid, true)
                end
            end
        })
    end

    --- Display Motion Practice Menu ---
    function M_ui.display_motion_practice_menu()
        local menu_lines = {
            "    ---    ", -- Line 0
            "   | k |   ", -- Line 1 (k at col 5)
            "    ---    ", -- Line 2
            " --- --- --- ", -- Line 3
            "| h |   | l |", -- Line 4 (h at col 2, l at col 10)
            " --- --- --- ", -- Line 5
            "    ---    ", -- Line 6
            "   | j |   ", -- Line 7 (j at col 5)
            "    ---    ", -- Line 8
            "",            -- Line 9
            "Press Esc or q to exit", -- Line 10
            "Then type :LearnVim start or :LearnVim contents" -- Line 11
        }

        -- Determine window size and position
        local content_width = 0
        for _, line in ipairs(menu_lines) do
            if #line > content_width then
                content_width = #line
            end
        end

        local win_width = math.max(content_width + 4, 25) -- Adjusted min width
        local win_height = #menu_lines + 2 -- Add padding for border

        local screen_width = vim.api.nvim_get_option_value('columns', {})
        local screen_height = vim.api.nvim_get_option_value('lines', {})
        local row = math.floor((screen_height - win_height) / 2)
        local col = math.floor((screen_width - win_width) / 2)

        -- Create buffer and window
        local menu_bufnr = vim.api.nvim_create_buf(false, true) -- nofile, scratch
        local win_opts = {
            relative = 'editor', style = 'minimal', border = 'rounded',
            width = win_width, height = win_height, row = row, col = col,
            focusable = true, zindex = 50
        }
        local menu_winid = vim.api.nvim_open_win(menu_bufnr, true, win_opts)

        -- Set buffer options (initially modifiable for setting lines)
        Utils.set_buffer_options(menu_bufnr, {
            modifiable = true,
            bufhidden = 'wipe', -- Ensure it gets wiped when hidden
            buftype = 'nofile',
            swapfile = false,
            cursorline = false,
            buflisted = false
        })

        -- Populate buffer
        vim.api.nvim_buf_set_lines(menu_bufnr, 0, -1, false, menu_lines)

        -- Syntax Highlighting for h,j,k,l
        local ns_id = vim.api.nvim_create_namespace('LearnVimMotionMenu')
        vim.api.nvim_set_hl(0, 'LearnVimKKey', { fg = 'Red', bold = true })
        vim.api.nvim_set_hl(0, 'LearnVimJKey', { fg = 'Green', bold = true })
        vim.api.nvim_set_hl(0, 'LearnVimHKey', { fg = 'Blue', bold = true })
        vim.api.nvim_set_hl(0, 'LearnVimLKey', { fg = 'Yellow', bold = true })
        vim.api.nvim_set_hl(0, 'LearnVimMotionActiveKey', { fg = 'White', bg = '#0000FF', bold = true }) -- Active key highlight

        local motion_keys_info = {
            k = { char = 'k', line = 1, col_start = 5, col_end = 6, hl_group = 'LearnVimKKey' },
            h = { char = 'h', line = 4, col_start = 2, col_end = 3, hl_group = 'LearnVimHKey' },
            l = { char = 'l', line = 4, col_start = 10, col_end = 11, hl_group = 'LearnVimLKey' },
            j = { char = 'j', line = 7, col_start = 5, col_end = 6, hl_group = 'LearnVimJKey' }
        }

        -- Apply initial highlights (1-indexed lines, 0-indexed byte-based columns)
        for _, key_info in pairs(motion_keys_info) do
            vim.api.nvim_buf_add_highlight(menu_bufnr, ns_id, key_info.hl_group, key_info.line, key_info.col_start, key_info.col_end)
        end

        -- Set final buffer options (nomodifiable)
        Utils.set_buffer_options(menu_bufnr, {
            modifiable = false,
            bufhidden = 'wipe',
            buftype = 'nofile',
            swapfile = false,
            cursorline = false,
            buflisted = false
        })

        -- Define Keymaps
        local close_callback = function()
            if vim.api.nvim_win_is_valid(menu_winid) then
                -- First, clear namespace if buffer is valid
                if menu_bufnr and vim.api.nvim_buf_is_valid(menu_bufnr) and ns_id then
                    vim.api.nvim_buf_clear_namespace(menu_bufnr, ns_id, 0, -1)
                end
                -- Then, close the window
                vim.api.nvim_win_close(menu_winid, true)
            end
        end

        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', '<Esc>', '', { noremap = true, silent = true, callback = close_callback })
        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', 'q', '', { noremap = true, silent = true, callback = close_callback })

        local current_active_key_char = nil -- Variable to keep track of the active key

        local function key_press_callback(pressed_key_char)
            return function()
                vim.notify("Pressed " .. pressed_key_char)

                -- 1. Reset all motion keys to their original highlights
                for key_char_loop, key_info in pairs(motion_keys_info) do
                    -- Clear the specific highlight region for this key on its line
                    vim.api.nvim_buf_clear_namespace(menu_bufnr, ns_id, key_info.line, key_info.line + 1)
                    -- Re-apply its original highlight
                    vim.api.nvim_buf_add_highlight(menu_bufnr, ns_id, key_info.hl_group, key_info.line, key_info.col_start, key_info.col_end)
                end
                
                -- If other non-motion key highlights were on the same lines and cleared by clear_namespace, they would need to be reapplied.
                -- For this menu, only motion keys are highlighted on these specific lines (1, 4, 7), so direct re-application is fine.

                -- 2. Apply active highlight to the pressed key
                local active_key_info = motion_keys_info[pressed_key_char]
                if active_key_info then
                    -- Clear its specific region again before applying new highlight (already done above, but good for safety if logic changes)
                    -- vim.api.nvim_buf_clear_namespace(menu_bufnr, ns_id, active_key_info.line, active_key_info.line + 1)
                    vim.api.nvim_buf_add_highlight(menu_bufnr, ns_id, 'LearnVimMotionActiveKey', active_key_info.line, active_key_info.col_start, active_key_info.col_end)
                    current_active_key_char = pressed_key_char -- Keep track
                end
                -- Menu remains open.
            end
        end

        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', 'h', '', { noremap = true, silent = true, callback = key_press_callback('h') })
        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', 'j', '', { noremap = true, silent = true, callback = key_press_callback('j') })
        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', 'k', '', { noremap = true, silent = true, callback = key_press_callback('k') })
        vim.api.nvim_buf_set_keymap(menu_bufnr, 'n', 'l', '', { noremap = true, silent = true, callback = key_press_callback('l') })

        -- Set focus to the window
        vim.api.nvim_set_current_win(menu_winid)
    end

    return M_ui
end
