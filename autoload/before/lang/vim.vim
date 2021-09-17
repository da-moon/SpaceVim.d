function! before#lang#vim#bootstrap()
  call SpaceVim#logger#info('[ before#lang#vim#bootstrap ] function called.')
      let g:spacevim_layers['lang#vim']={}
  call add(g:coc_global_extensions,'coc-vimlsp')
  call before#lang#vim#linter()
endfunction
function! before#lang#vim#linter()
  call SpaceVim#logger#info("[ before#lang#vim##linter ] function called")
  if executable('vimlparser')
    call SpaceVim#logger#info("[ before#lang#vim##linter ] vimlparser executable detected")
    command! LintVimLParser :silent cexpr system('vimlparser ' . expand('%') . ' > /dev/null')
    augroup lint_vimlparser
      autocmd!
      autocmd BufWritePost *.vim LintVimLParser
    augroup END
  endif
endfunction
