function! before#layers#checkers#bootstrap()
  call SpaceVim#logger#info("[ before#layers#checkers#bootstrap ] function called.")
  call add(g:spacevim_layers,'checkers')
  " let g:spacevim_lint_on_save="true"
  " let g:spacevim_show_cursor_error="false"
  call SpaceVim#layers#shell#set_variable({
      \ 'lint_on_save' : 'true',
      \ 'show_cursor_error' : 'false',
  \ })
endfunction
