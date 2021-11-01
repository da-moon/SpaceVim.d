function! before#spacevim#lang#rust#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  if (executable('rustup') && executable('rust-analyzer')) || executable('cargo')
    let g:spacevim_layers['lang#rust']={}
    let g:lsp_servers['rust']='rustup'
    let g:lsp_override_cmd['rust']=["rustup", "run", "nightly", "rust-analyzer"]
  endif
endfunction
