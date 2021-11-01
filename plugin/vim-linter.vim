if executable('vimlparser')
  call SpaceVim#logger#info('vimlparser executable detected')
  " ─────────────────────────────────────────────────────────────────────
  command! LintVimLParser :silent cexpr system('vimlparser ' . expand('%') . ' > /dev/null')
  " ─────────────────────────────────────────────────────────────────────
  augroup lint_vimlparser
    autocmd!
    autocmd BufWritePost *.vim LintVimLParser
  augroup END
endif
