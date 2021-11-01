
function! before#spacevim#filemanager#coc_explorer#load() abort 
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')

  let g:spacevim_filemanager=""
  let g:spacevim_filetree_direction=""
  let g:spacevim_enable_vimfiler_gitstatus=""
  call add(g:coc_global_extensions,'coc-explorer')
  call SpaceVim#logger#info(l:base_log_msg."setting up key bindings.")
  call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'CocCommand explorer --sources=buffer+,file+ --root-strategies workspace', 'toggle-file-and-buffer-tree', 1)
  call SpaceVim#custom#SPC('nnoremap', ['b', 't'], 'CocCommand explorer --sources=buffer+,file+ --root-strategies sourceBuffer', 'show-file-tree-at-buffer-dir', 1)
  augroup CocExplorer
    autocmd!
    " open explorer on start
    au VimEnter * :if bufname()=='' | call execute('CocCommand explorer') | endif
    " automatically close vim if coc-explorer is the last open buffer
    autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
  augroup END
endfunction
