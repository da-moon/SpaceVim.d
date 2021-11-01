" ### Treesitter Picker

" | Functions                           | Description                                       |
" |-------------------------------------|---------------------------------------------------|
" | `builtin.`                | 
function! before#telescope#treesitter#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.t = [':Telescope treesitter',
    \ 'Lists Treesitter function names, variables',
    \ [
    \ '[Leader t t] Lists Function names, variables, from Treesitter!',
    \ '',
    \ '',
    \ ]
    \ ]
endfunction
