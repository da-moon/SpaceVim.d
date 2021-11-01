function! before#coc#extensions#load()
  "   " \ 'coc-grammarly',
  let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-todolist',
    \ 'coc-spell-checker',
    \ 'coc-cspell-dicts',
    \ 'coc-tasks',
    \ 'coc-vimlsp',
  \]
  if system("uname -m") != "aarch64\n"
      call add(g:coc_global_extensions,'coc-tabnine')
  endif
  if executable('fzf')
    call add(g:coc_global_extensions,'coc-fzf-preview')
  end
endfunction

