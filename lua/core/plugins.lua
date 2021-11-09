-- https://jdhao.github.io/2021/07/11/from_vim_plug_to_packer/
local present, packer = pcall(require, "packer")
-- install packer if it cannot be loaded
if not present then
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd 'packadd packer.nvim'
    end
    -- reload packer
    packer = require("packer")
end
require("packer.luarocks").install_commands()
-- TODO
-- https://github.com/rcarriga/nvim-notify
return packer.startup(function()
    -- https://github.com/folke/tokyonight.nvim
    use {'folke/tokyonight.nvim'}
    use { 'wbthomason/packer.nvim' }
    use { 
        'nvim-treesitter/nvim-treesitter',
        requires = {'neovim/nvim-lspconfig'},
        run = ':TSUpdate'
    }
    use { 
        'glacambre/firenvim', 
        run = function() 
            vim.fn['firenvim#install'](0) 
        end ,
    }
    use { 
        'nvim-neorg/neorg',
        requires = {'nvim-lua/plenary.nvim'}
    }
    -- use {
    --     'nvim-telescope/telescope.nvim',
    --     requires = {'nvim-lua/plenary.nvim'} 
    -- }
    -- -- [ TODO ] only load when dependencies are installed
    -- use {
    --     'cljoly/telescope-repo.nvim',
    --     requires = {'nvim-telescope/telescope.nvim'},
    -- }
    -- use {
    --     'nvim-telescope/telescope-symbols.nvim',
    --     requires = {'nvim-telescope/telescope.nvim'},
    -- }
    -- use {
    --     'AckslD/nvim-neoclip.lua',
    --     requires = { 
    --         {'tami5/sqlite.lua', module = 'sqlite'},
    --         {'nvim-telescope/telescope.nvim'},
    --     },
    --     config = function()
    --         require('neoclip').setup()
    --     end,
    -- }
    -- use {
    --     'nvim-telescope/telescope-media-files.nvim',
    --     requires = {
    --         {'nvim-telescope/telescope.nvim'},
    --         {'nvim-lua/popup.nvim'},
    --     } 
    -- }
    -- use {
    --     'nvim-telescope/telescope-fzf-native.nvim',
    --     run = 'make',
    --     requires = {'nvim-telescope/telescope.nvim'},
    -- }
    -- use {
    --     'fannheyward/telescope-coc.nvim',
    --     requires = {'nvim-telescope/telescope.nvim'},
    -- }
    -- use {
    --     'crispgm/telescope-heading.nvim',
    --     requires = {'nvim-telescope/telescope.nvim'},
    -- }
    -- use {
    --   'sudormrfbin/cheatsheet.nvim',
    --   requires = {
    --     {'nvim-telescope/telescope.nvim'},
    --     {'nvim-lua/popup.nvim'},
    --     {'nvim-lua/plenary.nvim'},
    --   }
    -- }
    -- ────────────────────────────────────────────────────────────────────
    -- use_rocks "inspect"
end)
