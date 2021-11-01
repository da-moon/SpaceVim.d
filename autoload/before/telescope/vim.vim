function! before#telescope#vim#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.v = {'name' : '+Vim'}
  call before#telescope#vim#help()
  call before#telescope#vim#buffer()
  call before#telescope#vim#history()
  call before#telescope#vim#lists()
  call before#telescope#vim#internals()
  let g:_spacevim_mappings.t.v.c = [':Telescope commands',
  \ 'List and run available plugin/user commands',
  \ [
  \ '[Leader t v c] Lists available plugin/user commands and runs them on `<cr>`',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.v.t = [':Telescope tags',
  \ 'List and preview tags in current directory',
  \ [
  \ '[Leader t v t] Lists tags in current directory with tag location file preview (users are required to run ctags -R to generate tags or update when introducing new changes)',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.v.m = [':Telescope marks',
  \ 'List vim marks and their value',
  \ [
  \ '[Leader t v m] Lists vim marks and their value',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.v.s = [':Telescope spell_suggest',
  \ 'List and replace current word under the cursor with spelling suggestion',
  \ [
  \ '[Leader t v s] Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on `<cr>`',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.v.r = [':Telescope resume',
  \ 'List the results incl. multi-selections of the previous picker',
  \ [
  \ '[Leader t v r] Lists the results incl. multi-selections of the previous picker',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.v.p = [':Telescope pickers',
  \ 'Lists the previous pickers incl. multi-selections',
  \ [
  \ '[Leader t v p] Lists the previous pickers incl. multi-selections (see `:h telescope.defaults.cache_picker`)',
  \ '',
  \ '',
  \ ]
  \ ]
endfunction
function! before#telescope#vim#help()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.v.h = {'name' : '+Help'}
  let g:_spacevim_mappings.t.v.h.t = [':Telescope Help_tags',
  \ 'Lists and opens available help tags',
  \ [
  \ '[Leader t v h t] Lists available help tags and opens a new window with the relevant help info on `<cr>`',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.v.h.m = [':Telescope man_pages',
  \ 'Lists and opens manpage entries',
  \ [
  \ '[Leader t v h m] Lists manpage entries, opens them in a help window on `<cr>`',
  \ '',
  \ '',
  \ ]
  \ ]
endfunction

function! before#telescope#vim#buffer()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.v.b = {'name' : '+Buffer'}
  let g:_spacevim_mappings.t.v.b.o = [':Telescope buffers',
    \ 'Lists open buffers',
    \ [
    \ '[Leader t v b o] Lists open buffers in current neovim instance',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.v.b.s = [':Telescope current_buffer_fuzzy_find',
    \ 'Search current buffer',
    \ [
    \ '[Leader t v b s] Live fuzzy search inside of the currently open buffer',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.v.b.t = [':Telescope current_buffer_tags',
    \ 'List current open buffer tags',
    \ [
    \ '[Leader t v b t] Lists all of the tags for the currently open buffer, with a preview',
    \ '',
    \ '',
    \ ]
    \ ]
endfunction

function! before#telescope#vim#history()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.v.H = {'name' : '+History'}
  let g:_spacevim_mappings.t.v.H.f = [':Telescope oldfiles',
  \ 'Lists previously open files',
  \ [
  \ '[Leader t v H f] Lists previously open files',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.v.H.c = [':Telescope command_history',
  \ 'Lists and reruns recently executed commands',
  \ [
  \ '[Leader t v H c] Lists commands that were executed recently, and reruns them on `<cr>` ',
  \ '',
  \ '',
  \ ]
  \ ]
  let g:_spacevim_mappings.t.v.H.s = [':Telescope search_history',
  \ 'Lists and reruns recent searches',
  \ [
  \ '[Leader t v H s] Lists searches that were executed recently, and reruns them on `<cr>`',
  \ '',
  \ '',
  \ ]
  \ ]
endfunction
function! before#telescope#vim#lists()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.v.l = {'name' : '+Lists'}
  let g:_spacevim_mappings.t.v.l.q = [':Telescope quickfix',
    \ 'Lists items in the quickfix list',
    \ [
    \ '[Leader t v l q] Lists items in the quickfix list.',
    \ '',
    \ '',
    \ ]
    \ ]
 let g:_spacevim_mappings.t.v.l.l = [':Telescope loclist',
    \ 'Lists items from the current window location list',
    \ [
    \ '[Leader t v l l] Lists items from the current window location list.',
    \ '',
    \ '',
    \ ]
    \ ]
 let g:_spacevim_mappings.t.v.l.j = [':Telescope jumplist',
    \ 'Lists Jump List entries',
    \ [
    \ '[Leader t v l j] Lists Jump List entries.',
    \ '',
    \ '',
    \ ]
    \ ]
endfunction
function! before#telescope#vim#internals()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  let g:_spacevim_mappings.t.v.i = {'name' : '+Internals'}
  let g:_spacevim_mappings.t.v.i.o = [':Telescope vim_options',
    \ 'List and edit vim options',
    \ [
    \ '[Leader t v i o] Lists vim options, allows you to edit the current value on `<cr>`',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.v.i.c = [':Telescope colorscheme',
    \ 'List and apply available colorschemes',
    \ [
    \ '[Leader t v i c] Lists available colorschemes and applies them on `<cr>`',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.v.i.k = [':Telescope keymaps',
    \ 'Lists normal mode keymappings',
    \ [
    \ '[Leader t v i k] Lists normal mode keymappings',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.v.i.f = [':Telescope filetypes',
    \ 'Lists all available filetypes',
    \ [
    \ '[Leader t v i f] Lists all available filetypes',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.v.i.h = [':Telescope Highlights',
    \ 'Lists all available highlights',
    \ [
    \ '[Leader t v i h] Lists all available highlights',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.v.i.r = [':Telescope registers',
    \ 'Lists and paste contents of registers',
    \ [
    \ '[Leader t v i r] Lists vim registers, pastes the contents of the register on `<cr>` ',
    \ '',
    \ '',
    \ ]
    \ ]
  let g:_spacevim_mappings.t.v.i.a = [':Telescope autocommands',
    \ 'List autocommands and go to decleration location',
    \ [
    \ '[Leader t v i a] Lists vim autocommands and goes to their declaration on `<cr>`',
    \ '',
    \ '',
    \ ]
    \ ]
endfunction
