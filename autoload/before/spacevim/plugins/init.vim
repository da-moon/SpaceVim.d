function! before#spacevim#plugins#init#load() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call before#spacevim#plugins#init#custom_plugins()
  call before#spacevim#plugins#init#default_layers()
endfunction
function! before#spacevim#plugins#init#custom_plugins() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  " ─────────────────────────────────────────────────────────────────────
  " TODO
  " https://github.com/glepnir/dashboard-nvim
  " '': ':UpdateRemotePlugins'
  call add(g:spacevim_custom_plugins,['neovim/nvim-lspconfig'])
  call add(g:spacevim_custom_plugins,['williamboman/nvim-lsp-installer',{'merged':0}])
  " call add(g:spacevim_custom_plugins,['nvim-treesitter/nvim-treesitter'])
  call add(g:spacevim_custom_plugins,['jvirtanen/vim-hcl',{'on_ft' : 'hcl'}])
  call add(g:spacevim_custom_plugins,['dhruvasagar/vim-table-mode',{'on_ft':'markdown'}])
  call add(g:spacevim_custom_plugins,['junegunn/vim-easy-align'])
  call add(g:spacevim_custom_plugins,['neoclide/coc.nvim', { 'merged': 0,'build':'yarn install --frozen-lockfile'}])
  call add(g:spacevim_custom_plugins,['mg979/vim-visual-multi'])
  call add(g:spacevim_custom_plugins,['will133/vim-dirdiff'])
  call add(g:spacevim_custom_plugins,['tarekbecker/vim-yaml-formatter'])
  call add(g:spacevim_custom_plugins,['machakann/vim-highlightedyank'])
  call add(g:spacevim_custom_plugins,['sheerun/vim-polyglot'])
  call add(g:spacevim_custom_plugins,['github/copilot.vim'])
  if executable('i3')
    call add(g:spacevim_custom_plugins,['mboughaba/i3config.vim',{'on_ft' : ['i3','i3config']}])
  endif
  if executable('terraform')
    call add(g:spacevim_custom_plugins,['hashivim/vim-terraform',{ 'on_ft' :  ['tf','tfvars','terraform']}])
  endif
endfunction
function! before#spacevim#plugins#init#default_layers() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  " ─────────────────────────────────────────────────────────────────────
  let g:spacevim_layers['colorscheme']={}
  let g:spacevim_layers['tools'] = {}
  let g:spacevim_layers['ctrlspace'] = {}
  let g:spacevim_layers['ui' ] = {}
  let g:spacevim_layers['git']={}
  let g:spacevim_layers['github']={}
  let g:spacevim_layers['foldsearch']={}
  let g:spacevim_layers['core#statusline']={}
  let g:spacevim_layers['lang#extra']={}
  let g:spacevim_layers['lang#toml']={}
  let g:spacevim_layers['lang#json']={}
  let g:spacevim_layers['lang#yml']={}
  let g:spacevim_layers['lang#markdown']={}
  let g:spacevim_layers['lang#vim']={}
  let g:spacevim_layers['treesitter']={}
  if executable('sudo')
    call SpaceVim#logger#info(l:base_log_msg.'"sudo" binary detected. Adding associated layer')
    let g:spacevim_layers['sudo']={}
  end
  if executable('fzf')
    call SpaceVim#logger#info(l:base_log_msg.'"fzf" binary detected. Adding associated layer')
    let g:spacevim_layers['fzf']={}
  end
endfunction
