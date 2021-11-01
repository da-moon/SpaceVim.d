function! before#telescope#init#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t = {'name' : '+Telescope'}
  call before#telescope#file#load()
  call before#telescope#vim#load()
  call before#telescope#lsp#load()
  call before#telescope#git#load()
  call before#telescope#picker#load()
  call before#telescope#treesitter#load()
endfunction

