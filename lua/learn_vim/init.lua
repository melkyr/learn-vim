-- lua/learn_vim/init.lua

-- This is the main module for the LearnVim plugin.
-- It holds the central state and coordinates other sub-modules.
-- Other modules are required here and given access to the main M table.

local M = {} -- Our main module table

-- --- Central State and Resources ---
-- This table holds the current position in the tutorial and UI buffer/window IDs.
-- UI IDs are transient and not saved to the progress file.
M.current_state = {
    module = 1,
    lesson = 1,
    exercise = 1,
    tutorial_bufnr = -1, -- Buffer number for tutorial text display
    exercise_bufnr = -1, -- Buffer number for interactive exercises
    tutorial_winid = -1, -- Window ID for the tutorial text pane
    exercise_winid = -1, -- Window ID for the exercise pane
}

-- Path to the file where tutorial progress is saved.
-- stdpath('data') gives the standard data directory for Neovim.
M.progress_file = vim.fn.stdpath('data') .. '/learn_vim_progress.json'

-- The curriculum data is defined in a separate module and required directly.
-- It holds all the lesson explanations and exercise definitions.
M.curriculum = require('learn_vim.curriculum')


-- --- Require Sub-Modules and Assign Functions ---
-- Require each sub-module. Each sub-module is structured as a function
-- that accepts the main M table as an argument.
-- This allows sub-modules to access M.current_state and other M functions
-- without creating a circular dependency by requiring 'learn_vim' themselves.
-- Each sub-module function is expected to return a table of its public functions.

-- Load the state module and assign its functions to M
local state_module = require('learn_vim.state')(M) -- Pass M for state access
M.load_progress = state_module.load_progress
M.save_progress = state_module.save_progress


-- Load the UI module and assign its functions to M
local ui_module = require('learn_vim.ui')(M)     -- Pass M for state and curriculum access
M.setup_tutorial_ui = ui_module.setup_tutorial_ui -- Sets up the windows and buffers
M.display_lesson = ui_module.display_lesson       -- Populates the windows with lesson/exercise content


-- Load the navigation module and assign its functions to M
local nav_module = require('learn_vim.navigation')(M) -- Pass M for state, ui, state saving access
M.start = nav_module.start             -- Starts/resumes the tutorial
M.next_lesson = nav_module.next_lesson -- Moves to the next lesson/exercise
M.prev_lesson = nav_module.prev_lesson -- Moves to the previous lesson/exercise
M.goto_lesson = nav_module.goto_lesson -- Jumps to a specific lesson
M.restart_tutorial = nav_module.restart_tutorial -- Resets progress and restarts


-- Load the exercise module and assign its functions to M
local exercise_module = require('learn_vim.exercise')(M) -- Pass M for state, ui, validation, navigation access
M.check_current_exercise = exercise_module.check_current_exercise -- Checks if the current exercise is complete
M.reset_current_exercise = exercise_module.reset_current_exercise -- Resets the current exercise state
-- validate_exercise is kept internal to the exercise module as it's only called by check_current_exercise


-- Return the main module M.
-- This table M is what is returned when 'require("learn_vim")' is called
-- (e.g., from plugin/learn_vim.lua or other modules needing access).
return M
