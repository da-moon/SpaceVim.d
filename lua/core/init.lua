local modules = {
    "core.options",
    "core.plugins",
    "core.utils",
}
for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end

local M = {}
M.utils = require('core.utils')
return M
