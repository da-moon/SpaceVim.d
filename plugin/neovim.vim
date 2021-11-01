if has('nvim')
  autocmd VimEnter * silent! UpdateRemotePlugins
  call SpaceVim#logger#info('disable Perl support')
  let g:loaded_perl_provider = 0
  call SpaceVim#logger#info('disable Ruby support')
  let g:loaded_ruby_provider = 0
  call SpaceVim#logger#info('display result of incremental commands (ex. :%s/pat1/pat2/g)')
  set inccommand=split
  call SpaceVim#logger#info('enter terminal buffer in Insert instead of Normal mode')
  augroup shell
    autocmd!
    autocmd TermOpen term://* startinsert
    autocmd TermOpen term://* let g:terminal_winid=win_getid()
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
    autocmd WinClosed term://* unlet g:teminal_winid
  augroup END
  if executable('nvr')
    let $GIT_EDITOR = 'nvr -cc split --remote-wait'
    autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
  endif
endif

