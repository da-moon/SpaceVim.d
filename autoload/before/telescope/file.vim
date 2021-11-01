function! before#telescope#file#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.f = {'name' : '+File'}
  let g:_spacevim_mappings.t.f.f = [':Telescope find_files',
    \ 'Lists files',
    \ [
    \ '[Leader t f f] Lists files in your current working directory, respects .gitignore',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.f.g = [':Telescope git_files',
    \ 'Fuzzy search through the output of `git ls-files` command',
    \ [
    \ '[Leader t f g] Fuzzy search through the output of `git ls-files` command, respects .gitignore, optionally ignores untracked files',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.f.b = [':Telescope file_browser',
    \ 'Open file manager',
    \ [
    \ '[Leader t f b] Lists files and folders in your current working directory, open files, navigate your filesystem, and create new files and folders',
    \ '',
    \ '',
    \ ]
    \ ]
  if executable('rg')
    let g:_spacevim_mappings.t.f.s = [':Telescope grep_string',
      \ 'Searches for the string under your cursor',
      \ [
      \ '[Leader t f s] Searches for the string under your cursor in your current working directory',
      \ '',
      \ '',
      \ ]
      \ ]
    let g:_spacevim_mappings.t.f.r = [':Telescope live_grep',
      \ 'Live search for a string',
      \ [
      \ '[Leader t f r] Search for a string in your current working directory and get results live as you type (respecting .gitignore)   ',
      \ '',
      \ '',
      \ ]
      \ ]
  endif
endfunction
