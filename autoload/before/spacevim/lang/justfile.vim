function! before#spacevim#lang#justfile#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')

  if executable('just')
    call SpaceVim#logger#info(l:base_log_msg."Just Executable detected")
    call add(g:spacevim_custom_plugins,['vmchale/just-vim',{ 'on_ft': 'justfile' }])
    if (filereadable('Justfile') || filereadable('justfile'))
      call SpaceVim#logger#info(l:base_log_msg."Project Justfile detected")
      call SpaceVim#plugins#tasks#reg_provider(function('s:justfile_tasks'))
      call SpaceVim#logger#info(l:base_log_msg."Registered Justfile task provider function")
    endif
  endif
endfunction
function! s:justfile_tasks() abort
  let commands=split(system('just --summary --color never'),' ',1)
  let conf = {}
  for cmd in commands
    call extend(conf, {
    \ cmd : {
    \ 'command': 'just',
    \ 'args' : [cmd],
    \ 'isDetected' : 1,
    \ 'detectedName' : 'just:'
    \ }
    \ })
  endfor
  return conf
endfunction

