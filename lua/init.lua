-- https://github.com/qwelyt/docker-stuff
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/plugins.lua
-- https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/lua/start.lua
local modules = {
    "core",
    -- "telescope",
}
for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    -- print('loaded' .. module .. ': ' .. string.format('%s',ok))
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end

-- local utils = require ('core.utils')
-- local global_spc = vim.api.nvim_get_var('_spacevim_mappings')
-- print(utils.dump_table(global_spc.t))
