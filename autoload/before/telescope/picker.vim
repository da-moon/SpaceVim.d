function! before#telescope#picker#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.p = {'name' : '+Picker'}
  let g:_spacevim_mappings.t.p.p = [':Telescope planets',
    \ 'Lists telescope planets',
    \ [
    \ '[Leader t p p] Use the telescope...',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.p.b = [':Telescope builtin',
    \ 'Lists Built-in pickers',
    \ [
    \ '[Leader t p b] Lists Built-in pickers and run them on `<cr>`.',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.p.r = [':Telescope reloader',
    \ 'Lists and reload Lua modules',
    \ [
    \ '[Leader t p r] Lists Lua modules and reload them on `<cr>`.',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.p.s = [':Telescope symbols',
    \ 'Lists symbols',
    \ [
    \ '[Leader t p s]  Lists symbols inside a file `data/telescope-sources/*.json` found in your rtp.',
    \ '',
    \ '',
    \ ]
    \ ]
endfunction
