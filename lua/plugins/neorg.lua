-- https://github.com/nvim-neorg/neorg
require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
         -- Load all the default modules
        ['core.defaults'] = {},
         -- Allows for use of icons
        ['core.norg.concealer'] = {},
         -- Manage your directories with Neorg
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    my_workspace = '~/sync/neorg'
                }
            }
        }
    },
}
