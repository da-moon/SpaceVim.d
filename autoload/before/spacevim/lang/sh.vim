function! before#spacevim#lang#sh#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
    if executable('sh')
      let g:spacevim_layers['lang#sh']={}
      let g:lsp_servers['sh']='bash-language-server'
      if executable('shfmt')
        call add(g:spacevim_custom_plugins,['z0mbix/vim-shfmt',{ 'on_ft': 'sh' }])
      end
    end
endfunction
