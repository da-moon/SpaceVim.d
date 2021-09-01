function! before#layers#checkers#bootstrap()
  call SpaceVim#logger#info("[ before#layers#checkers#bootstrap ] function called.")
  let g:spacevim_layers['checkers']={
      \ 'lint_on_save' : 'true',
      \ 'show_cursor_error' : 'false',
  \ }
endfunction
