-- lua/learn_vim/locale.lua

local M = {}

-- The currently loaded translations
M.translations = {}

-- The current language
M.language = "en"

-- Loads the translation file for the given language
function M.load_language(lang)
    M.translations = {}
    M.language = lang

    local path = "lua/learn_vim/locales/" .. lang .. "/modules/*.lua"
    local files = vim.fn.globpath(path, true, true)

    if #files == 0 and lang ~= "en" then
        -- Fallback to English if the language directory is empty or doesn't exist
        M.load_language("en")
        return
    end

    for _, file_path in ipairs(files) do
        -- Convert file path to module path (e.g., /path/to/lua/learn_vim/locales/en/modules/module0.lua -> learn_vim.locales.en.modules.module0)
        local module_path = file_path:gsub(".*/lua/", ""):gsub("/", "."):gsub(".lua$", "")

        local ok, module_translations = pcall(require, module_path)
        if ok then
            for k, v in pairs(module_translations) do
                M.translations[k] = v
            end
        else
            vim.notify("Error loading translation file: " .. file_path, vim.log.levels.WARN)
        end
    end
end

-- Gets a translated string by its key
function M.get(key)
    return M.translations[key] or key
end

return M
