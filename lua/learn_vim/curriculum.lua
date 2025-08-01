-- lua/learn_vim/curriculum.lua

-- This module serves as the central point for accessing all curriculum content.
-- It requires individual module files and combines their data.

local Locale = require('learn_vim.locale')
local lang = Locale.get_language()

local function require_module(module_name)
    local path = 'learn_vim.locales.' .. lang .. '.modules.' .. module_name
    local p, module = pcall(require, path)
    if p then
        return module
    else
        -- Fallback to English if the module is not available in the selected language
        local fallback_path = 'learn_vim.locales.en.modules.' .. module_name
        local fp, fallback_module = pcall(require, fallback_path)
        if fp then
            return fallback_module
        else
            error("Failed to load module " .. module_name .. " for language " .. lang .. " and fallback English.")
        end
    end
end

local module0 = require_module('module0')
local module1 = require_module('module1')
local module2 = require_module('module2')
local module3 = require_module('module3')
local module4 = require_module('module4')
local module5 = require_module('module5')
local module6 = require_module('module6')
local module7 = require_module('module7')
local module8 = require_module('module8')
local module9 = require_module('module9')
local module10 = require_module('module10')
local module11 = require_module('module11')
local module12 = require_module('module12')
local module13 = require_module('module13')
local module14 = require_module('module14')

-- Combine the data from the individual module files into a single curriculum table.
-- The keys (module1, module2, etc.) are used by the navigation logic
-- to access the content for a specific module.
local curriculum = {
    module0 = module0,
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
    module12 = module12,
    module13 = module13,
    module14 = module14, -- Add the new module8 to the curriculum table
    -- Add more modules here:
    -- module9 = module9,
}

-- Return the combined curriculum table.
-- This table is then accessed by other parts of the plugin (like navigation and UI)
-- via the main 'M' table in init.lua.
return curriculum
