function! before#lang#markdown#bootstrap()
  call SpaceVim#logger#info("[ before#lang#markdown#bootstrap ] function called.")
    let g:spacevim_layers['lang#markdown']={}
    call add(g:coc_global_extensions,'coc-markdownlint')
    call SpaceVim#custom#LangSPCGroupName('markdown', ['C'], '+Coc-markdown')
    call before#lang#markdown#coc_markmap()
    call before#lang#markdown#coc_reveal()
    call before#lang#markdown#vim_table_mode()
endfunction
function! before#lang#markdown#coc_reveal()
  call SpaceVim#logger#info("[ before#lang#markdown#coc_reveal ] function called.")
  call add(g:coc_global_extensions,'coc-reveal')
  call SpaceVim#custom#LangSPC('markdown', 'nmap', ['C','r'], '<plug>(coc-reveal-it)', 'create-slides-from-the-whole-file', 0)
  call SpaceVim#custom#LangSPC('markdown', 'vmap', ['C','r'], '<plug>(coc-reveal-it-v)', 'create-slides-from-the-selected-lines', 0)
  call SpaceVim#logger#info("[ before#lang#markdown#coc_reveal ] Define a command to create slides.")
  command! -range=% RevealIt CocCommand reveal.it <line1> <line2>
endfunction
" [ NOTE ] => https://github.com/gera2ld/coc-markmap
function! before#lang#markdown#coc_markmap()
  call SpaceVim#logger#info("[ before#lang#markdown#coc_markmap ] function called.")
  call add(g:coc_global_extensions,'coc-markmap')
  call SpaceVim#custom#LangSPC('markdown', 'nmap', ['C','m'], '<plug>(coc-markmap-create)', 'create-markmap-from-the-whole-file', 0)
  call SpaceVim#custom#LangSPC('markdown', 'vmap', ['C','m'], '<plug>(coc-markmap-create-v)', 'create-markmap-from-the-selected-lines', 0)
  call SpaceVim#logger#info("[ before#lang#markdown#coc_markmap ] Define command to markmap.")
  command! -range=% Markmap CocCommand markmap.create <line1> <line2>
endfunction

function! before#lang#markdown#vim_table_mode()
  call SpaceVim#logger#info("[ before#lang#markdown#vim_table_mode ] function called.")
  call add(g:spacevim_custom_plugins,['dhruvasagar/vim-table-mode',{'on_ft':'markdown'}])
  function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
  endfunction
  inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
  inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'
  call SpaceVim#custom#LangSPC('markdown', 'nmap', ['C','t'], 'TableModeToggle', 'create-table', 0)
endfunction
