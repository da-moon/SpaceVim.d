function! before#spacevim#nvim#bootstrap() abort
  call SpaceVim#logger#info("[ before#spacevim#nvim#bootstrap ] function called.")
  if has('nvim')
    autocmd VimEnter * silent! UpdateRemotePlugins
    call SpaceVim#logger#info("[ before#spacevim#nvim#bootstrap ] display result of incremental commands (ex. :%s/pat1/pat2/g) ")
    set inccommand=split
    call SpaceVim#logger#info("[ before#spacevim#nvim#bootstrap ] enter terminal buffer in Insert instead of Normal mode")
    augroup shell
      autocmd!
      autocmd TermOpen term://* startinsert
      autocmd TermOpen term://* let g:terminal_winid=win_getid()
      autocmd BufWinEnter,WinEnter term://* startinsert
      autocmd BufLeave term://* stopinsert
      autocmd WinClosed term://* unlet g:teminal_winid
    augroup END
  endif
endfunction
