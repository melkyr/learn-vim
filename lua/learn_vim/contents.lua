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
    local module_num = 1

    while true do
        local module_key = "module" .. module_num
        if not curriculum_data[module_key] then
            -- No more modules found, break the loop
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
                -- No more lessons in this module, break the inner loop
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
