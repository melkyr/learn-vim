-- lua/learn_vim/init.lua

-- This is the main entry point for the LearnVim plugin logic.
-- It sets up the core structure, loads other modules, manages state,
-- and provides the main API functions called by plugin/learn_vim.lua.

local M = {} -- The main module table

-- --- Plugin State ---
-- Stores the current state of the tutorial for persistence.
-- Initialize with default values. These will be overwritten if progress is loaded.
M.current_state = {
    module = 1,         -- Current module number (integer)
    lesson = 1,         -- Current lesson number within the module (integer)
    exercise = 1,       -- Current exercise number within the lesson (integer)
    tutorial_bufnr = -1, -- Buffer number for the tutorial pane (-1 if not created)
    exercise_bufnr = -1, -- Buffer number for the exercise pane (-1 if not created)
    tutorial_winid = -1, -- Window ID for the tutorial pane (-1 if not created)
    exercise_winid = -1, -- Window ID for the exercise pane (-1 if not created)
    -- Add any other state variables needed later (e.g., completed exercises in a lesson)
}

-- --- Configuration ---
-- Default configuration options. Users can override these in their init.lua.
M.config = {
    -- Path to save/load tutorial progress. Defaults to a file in Neovim's state directory.
    progress_file = vim.fn.stdpath('state') .. '/learn_vim_progress.json',
    debug = false, -- Add this line
    -- Add other configuration options here later (e.g., UI colors, default window sizes)
}

-- --- Module Loading ---
-- Require other modules and attach them to the main module table M.
-- This makes their functions accessible throughout the plugin via M.<module_name>.<function_name>.
-- Based on debug prints:
-- - curriculum returns a table directly.
-- - ui, navigation, and state return a setup function that needs to be called with M.
-- - exercise is currently returning a table directly (unexpected based on code, but observed).

if M.config.debug then
    vim.notify("LearnVim Debug: Requiring curriculum...", vim.log.levels.INFO)
end
local curriculum_module = require('learn_vim.curriculum')
if M.config.debug then
    vim.notify("LearnVim Debug: Type of curriculum_module: " .. type(curriculum_module), vim.log.levels.INFO)
end
M.curriculum = curriculum_module -- Assign curriculum directly

if M.config.debug then
    vim.notify("LearnVim Debug: Requiring ui...", vim.log.levels.INFO)
end
local ui_setup = require('learn_vim.ui')
if M.config.debug then
    vim.notify("LearnVim Debug: Type of ui_setup: " .. type(ui_setup), vim.log.levels.INFO)
end
M.ui = ui_setup(M) -- Call setup function and assign result

if M.config.debug then
    vim.notify("LearnVim Debug: Requiring navigation...", vim.log.levels.INFO)
end
local navigation_setup = require('learn_vim.navigation')
if M.config.debug then
    vim.notify("LearnVim Debug: Type of navigation_setup: " .. type(navigation_setup), vim.log.levels.INFO)
end
M.navigation = navigation_setup(M) -- Call setup function and assign result

if M.config.debug then
    vim.notify("LearnVim Debug: Requiring exercise...", vim.log.levels.INFO)
end
local exercise_module = require('learn_vim.exercise') -- Renamed to exercise_module as it's a table
if M.config.debug then
    vim.notify("LearnVim Debug: Type of exercise_module: " .. type(exercise_module), vim.log.levels.INFO)
end
M.exercise = exercise_module -- Assign exercise table directly (based on debug output)

if M.config.debug then
    vim.notify("LearnVim Debug: Requiring state...", vim.log.levels.INFO)
end
local state_setup = require('learn_vim.state')
if M.config.debug then
    vim.notify("LearnVim Debug: Type of state_setup: " .. type(state_setup), vim.log.levels.INFO)
end
M.state = state_setup(M) -- Call setup function and assign result


-- --- Core Plugin Functions (exposed to plugin/learn_vim.lua) ---
-- These functions are the public API of the plugin, called by user commands/mappings.

--- Starts the tutorial.
-- Loads progress, sets up the UI, and displays the current lesson.
function M.start()
    -- Now that modules are assigned their tables correctly, call their functions.
    M.state.load_progress() -- Load saved progress

    -- Close all other windows before setting up the tutorial UI.
    -- This ensures the tutorial is the only thing visible.
    -- Use :only command which closes all windows except the current one.
    -- We use pcall in case there's only one window open already.
    pcall(vim.cmd, 'only')

    M.ui.setup_tutorial_ui() -- Setup the tutorial windows and buffers

    -- Enable search highlighting by default when the tutorial starts.
    vim.opt.hlsearch = true
    -- Optional: Show a message indicating hlsearch is on.
    -- vim.notify("Search highlighting enabled (:set hlsearch). Use :nohlsearch or :set nohlsearch to disable.", vim.log.levels.INFO)


    M.ui.display_lesson(M.current_state.module, M.current_state.lesson) -- Display the current lesson based on loaded state
    vim.notify("Learning Vim: Starting at Module " .. M.current_state.module .. ", Lesson " .. M.current_state.lesson .. ". Use ':LearnVim exc' to check, ':LearnVim exr' to reset.", vim.log.levels.INFO)
    vim.api.nvim_command('redraw') -- Force redraw to ensure UI updates are visible immediately
end

--- Moves to the next lesson/exercise.
-- This is called by :LearnVim next and automatically after exercise completion.
function M.next_lesson()
    M.navigation.next_lesson()
end

--- Moves to the previous lesson.
-- Called by :LearnVim prev.
function M.prev_lesson()
    M.navigation.prev_lesson()
end

--- Jumps to a specific lesson.
-- Called by :LearnVim lesson <module>.<lesson>.
-- @param module_id The target module number.
-- @param lesson_id The target lesson number.
function M.goto_lesson(module_id, lesson_id)
    M.navigation.goto_lesson(module_id, lesson_id)
end

--- Restarts the tutorial from the beginning.
-- Called by :LearnVim restart.
function M.restart_tutorial()
    -- Store old IDs before they are reset from M.current_state
    local old_tutorial_winid = M.current_state.tutorial_winid
    local old_exercise_winid = M.current_state.exercise_winid
    -- local old_tutorial_bufnr = M.current_state.tutorial_bufnr -- Optional for now
    -- local old_exercise_bufnr = M.current_state.exercise_bufnr -- Optional for now

    -- Close the windows if they are valid
    if old_tutorial_winid ~= -1 and vim.api.nvim_win_is_valid(old_tutorial_winid) then
        pcall(vim.api.nvim_win_close, old_tutorial_winid, true)
    end
    if old_exercise_winid ~= -1 and vim.api.nvim_win_is_valid(old_exercise_winid) then
        pcall(vim.api.nvim_win_close, old_exercise_winid, true)
    end
    
    -- Optional: Explicitly delete old buffers (consider if needed, bufhidden=hide might suffice)
    -- if old_tutorial_bufnr ~= -1 and vim.api.nvim_buf_is_valid(old_tutorial_bufnr) then
    --     pcall(vim.api.nvim_buf_delete, old_tutorial_bufnr, { force = true })
    -- end
    -- if old_exercise_bufnr ~= -1 and vim.api.nvim_buf_is_valid(old_exercise_bufnr) then
    --     pcall(vim.api.nvim_buf_delete, old_exercise_bufnr, { force = true })
    -- end

     -- Reset the state to the initial values.
     M.current_state = { module = 1, lesson = 1, exercise = 1 }
     -- Reset UI state as well, so setup_tutorial_ui recreates windows/buffers cleanly.
     M.current_state.tutorial_bufnr = -1
     M.current_state.exercise_bufnr = -1
     M.current_state.tutorial_winid = -1
     M.current_state.exercise_winid = -1

     M.state.save_progress() -- Save the reset state

     -- Close all other windows before setting up the UI on restart as well
     pcall(vim.cmd, 'only')

     M.ui.setup_tutorial_ui() -- Recreate UI
     -- Enable search highlighting on restart too
     vim.opt.hlsearch = true

     M.ui.display_lesson(M.current_state.module, M.current_state.lesson) -- Display the first lesson
     vim.notify("Tutorial restarted. Use ':LearnVim exc' to check, ':LearnVim exr' to reset.", vim.log.levels.INFO)
     vim.api.nvim_command('redraw')
end


--- Checks the completion of the current exercise.
-- Called by :LearnVim exc.
function M.check_current_exercise()
    M.exercise.check_current_exercise()
end

--- Resets the current exercise.
-- Called by :LearnVim exr.
function M.reset_current_exercise()
    M.exercise.reset_current_exercise()
end

--- Saves the current tutorial progress.
-- Called internally when progress changes.
function M.save_progress()
    M.state.save_progress()
end

--- Loads tutorial progress from the save file.
-- Called internally at startup.
function M.load_progress()
    M.state.load_progress()
end

-- --- Plugin Setup ---
-- Function to be called by the user in their init.lua to configure the plugin.
-- Currently, just merges user config with defaults.
function M.setup(opts)
    opts = opts or {}
    M.config = vim.tbl_deep_extend('force', M.config, opts)
    -- You might want to load progress here if setup could change the save file path,
    -- but doing it in M.start() ensures UI is ready.
end


-- Return the main module table M, exposing its functions and state.
return M
