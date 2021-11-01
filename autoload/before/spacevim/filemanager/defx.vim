function! before#spacevim#filemanager#defx#load() abort
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:spacevim_filemanager="defx"
  let g:spacevim_filetree_direction="left"
  let g:spacevim_enable_vimfiler_gitstatus="true"
  fun! DefxDrawerToggle()
    if bufwinnr('defx') > 0
      execute "bd! " . bufnr('defx')
    else
      rightbelow vert split
      Defx `expand('%:p:h')`
      vert resize 60
    endif
  endfun
endfunction


