function! before#coc#lang#markdown#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
    let g:spacevim_layers['']={}
    call add(g:coc_global_extensions,'coc-markdownlint')
    call SpaceVim#custom#LangSPCGroupName('markdown', ['C'], '+Coc-markdown')
    call before#coc#lang#markdown#coc_reveal()
    call before#coc#lang#markdown#coc_markmap()
endfunction
function! before#coc#lang#markdown#coc_reveal()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call add(g:coc_global_extensions,'coc-reveal')
  call SpaceVim#custom#LangSPC('markdown', 'nmap', ['C','r'], '<plug>(coc-reveal-it)', 'create-slides-from-the-whole-file', 0)
  call SpaceVim#custom#LangSPC('markdown', 'vmap', ['C','r'], '<plug>(coc-reveal-it-v)', 'create-slides-from-the-selected-lines', 0)
  call SpaceVim#logger#info(l:base_log_msg.'Define a command to create slides.')
  command! -range=% RevealIt CocCommand reveal.it <line1> <line2>
endfunction
" [ NOTE ] => https://github.com/gera2ld/coc-markmap
function! before#coc#lang#markdown#coc_markmap()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  call add(g:coc_global_extensions,'coc-markmap')
  call SpaceVim#custom#LangSPC('markdown', 'nmap', ['C','m'], '<plug>(coc-markmap-create)', 'create-markmap-from-the-whole-file', 0)
  call SpaceVim#custom#LangSPC('markdown', 'vmap', ['C','m'], '<plug>(coc-markmap-create-v)', 'create-markmap-from-the-selected-lines', 0)
  call SpaceVim#logger#info(l:base_log_msg.'Define command to markmap.')
  command! -range=% Markmap CocCommand markmap.create <line1> <line2>
endfunction
