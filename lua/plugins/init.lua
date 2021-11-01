local modules = {
    'plugins.neorg',
}
for _,module in ipairs(modules) do
    local ok,err = pcall(require,module)
    if not ok then
        error('error loading ' .. module .. '\n\n' .. err)
    end
end

