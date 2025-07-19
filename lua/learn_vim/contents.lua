-- lua/learn_vim/contents.lua

-- This module generates a structured list of menu items (contents)
-- based on the curriculum data.

local Contents = {}

-- Require the curriculum data
local curriculum_data = require('learn_vim.curriculum')

--- Generates a structured list of menu items for navigation.
-- @return A list of tables, where each table represents a menu item.
--         Module title items have: { type = "module_title", display_text = "..." }
--         Lesson items have: { type = "lesson_item", module_num = X, lesson_num = Y, display_text = "..." }
Contents.get_menu_items = function()
    local menu_items = {}

    -- Handle module0 explicitly
    local module0_key = "module0"
    if curriculum_data[module0_key] then
        local module_content = curriculum_data[module0_key]
        local module_title_text = "Module 0: " .. (module_content.title or "Untitled Module") -- Adjusted title format for M0
        table.insert(menu_items, {
            type = "module_title",
            display_text = module_title_text
        })

        local lesson_num = 1
        while true do
            local lesson_key = "lesson" .. lesson_num
            if not module_content[lesson_key] then
                break
            end
            local lesson_content = module_content[lesson_key]
            -- Adjusted lesson title format for M0
            local lesson_title_text = "  0." .. lesson_num .. " " .. (lesson_content.title or "Untitled Lesson")
            table.insert(menu_items, {
                type = "lesson_item",
                module_num = 0, -- Use 0 for module_num for M0
                lesson_num = lesson_num,
                display_text = lesson_title_text
            })
            lesson_num = lesson_num + 1
        end
    end

    -- Original loop for modules 1 and up
    local module_num = 1
    while true do
        local module_key = "module" .. module_num
        if not curriculum_data[module_key] then
            break
        end

        local module_content = curriculum_data[module_key]
        local module_title_text = "Module " .. module_num .. ": " .. (module_content.title or "Untitled Module")
        table.insert(menu_items, {
            type = "module_title",
            display_text = module_title_text
        })

        local lesson_num = 1
        while true do
            local lesson_key = "lesson" .. lesson_num
            if not module_content[lesson_key] then
                break
            end

            local lesson_content = module_content[lesson_key]
            local lesson_title_text = "  " .. module_num .. "." .. lesson_num .. " " .. (lesson_content.title or "Untitled Lesson")
            table.insert(menu_items, {
                type = "lesson_item",
                module_num = module_num,
                lesson_num = lesson_num,
                display_text = lesson_title_text
            })

            lesson_num = lesson_num + 1
        end
        module_num = module_num + 1
    end

    return menu_items
end

return Contents
