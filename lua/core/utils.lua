local M = {}
M.map = function(modes, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    for mode in modes:gmatch"." do
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end
-- https://stackoverflow.com/a/27028488
M.dump_table = function (o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. M.dump_table(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
return M
