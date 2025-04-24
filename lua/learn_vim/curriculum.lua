-- lua/learn_vim/curriculum.lua

-- This module serves as the central point for accessing all curriculum content.
-- It requires individual module files and combines their data.

-- Require individual module files from the lua/learn_vim/modules directory.
-- Make sure you have created these files (e.g., module1.lua, module2.lua, ..., module8.lua)
-- and placed the content for each module within them.
local module1 = require('learn_vim.modules.module1')
local module2 = require('learn_vim.modules.module2')
local module3 = require('learn_vim.modules.module3')
local module4 = require('learn_vim.modules.module4')
local module5 = require('learn_vim.modules.module5')
local module6 = require('learn_vim.modules.module6')
local module7 = require('learn_vim.modules.module7')
local module8 = require('learn_vim.modules.module8')
local module9 = require('learn_vim.modules.module9')
local module10 = require('learn_vim.modules.module10')
local module11 = require('learn_vim.modules.module11')
local module12 = require('learn_vim.modules.module12')
local module13 = require('learn_vim.modules.module13')
local module14 = require('learn_vim.modules.module14')
-- Add more modules here as you create them:
-- local module9 = require('learn_vim.modules.module9')

-- Combine the data from the individual module files into a single curriculum table.
-- The keys (module1, module2, etc.) are used by the navigation logic
-- to access the content for a specific module.
local curriculum = {
    module1 = module1,
    module2 = module2,
    module3 = module3,
    module4 = module4,
    module5 = module5,
    module6 = module6,
    module7 = module7,
    module8 = module8,
    module9 = module9,
    module10 = module10,
    module11 = module11,
    module12 = module12.
    module13 = module13,
    module14 = module14-- Add the new module8 to the curriculum table
    -- Add more modules here:
    -- module9 = module9,
}

-- Return the combined curriculum table.
-- This table is then accessed by other parts of the plugin (like navigation and UI)
-- via the main 'M' table in init.lua.
return curriculum
