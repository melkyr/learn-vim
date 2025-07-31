-- lua/learn_vim/locale.lua

local M = {}

-- The currently loaded translations
M.translations = {}

-- The current language
M.language = "en"

-- Loads the translation file for the given language
function M.load_language(lang)
    local success, lang_module = pcall(require, "learn_vim.locales." .. lang)
    if success then
        M.translations = lang_module
        M.language = lang
    else
        -- Fallback to English if the language file doesn't exist
        M.load_language("en")
    end
end

-- Gets a translated string by its key
function M.get(key)
    return M.translations[key] or key
end

return M
