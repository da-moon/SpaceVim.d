" https://github.com/unlackingc/myDevEnv/blob/master/vim/go.vim
function! before#spacevim#lang#go#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if executable('go')
    call SpaceVim#logger#info(l:base_log_msg.'go toolchain detected. Adding associated vim plugin and configuration')
    call add(g:spacevim_custom_plugins,['fatih/vim-go',{ 'on_ft' : 'go','build': ':GoUpdateBinaries','hook_post_update': ':GoUpdateBinaries' }])
    let g:spacevim_layers['lang#go']={}
    call SpaceVim#logger#info(l:base_log_msg.'go toolchain detected. Adding SPC layer')
    if executable('gopls')
      call SpaceVim#logger#info(l:base_log_msg.'gopls executable detected')
      let g:lsp_servers['go']='gopls'
      let g:lsp_override_cmd['go']=['gopls', '-mode', 'stdio']
      call add(g:enabled_clients,'gopls')
    endif
  endif
endfunction
