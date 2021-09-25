autocmd VimEnter * call dein#call_hook('post_source')
let g:spacevim_custom_plugins = [
  \ ['jvirtanen/vim-hcl',{ 'on_ft' : 'hcl'}],
  \ ['mboughaba/i3config.vim',{ 'on_ft' : ['i3','i3config']}],
  \ ['junegunn/vim-easy-align'],
  \ ['neoclide/coc.nvim'],
  \ ['mg979/vim-visual-multi'],
  \ ['will133/vim-dirdiff'],
  \ ['tarekbecker/vim-yaml-formatter'],
  \ ['machakann/vim-highlightedyank'],
  \ ['sheerun/vim-polyglot'],
  \ ['metakirby5/codi.vim'],
\ ]
let g:spacevim_layers={
  \ 'colorscheme' : {},
  \ 'tools': {},
  \ 'ctrlspace' : {},
  \ 'ui' : {},
  \ 'git': {},
  \ 'github' : {},
  \ 'foldsearch':{},
  \ 'core#statusline':{},
  \ 'lang#extra':{},
  \ 'lang#toml':{},
\ }
  " \ 'coc-grammarly',
let g:coc_global_extensions = [
  \ 'coc-marketplace',
  \ 'coc-todolist',
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts',
  \ 'coc-tasks',
\]
if system("uname -m") != "aarch64\n"
    call add(g:coc_filetypes,'coc-tabnine')
endif
let g:coc_preferences = {
  \ 'autoTrigger': 'always',
  \ 'maxCompleteItemCount': 10,
  \ 'codeLens.enable': 1,
  \ 'diagnostic.virtualText': 1,
\}
let g:coc_languageserver={}
let g:lsp_servers = {}
let g:lsp_override_cmd={}
let g:coc_filetypes=[]
function! init#before() abort
  call SpaceVim#logger#info("[ init#before ] function called")
  
" ─── SPACEVIM COMMON CONFIGURATAION ─────────────────────────────────────────────
  if executable('shfmt')
    call SpaceVim#logger#info("[ init#before ] 'shfmt' binary detected. Adding associated vim plugin")
    call add(g:spacevim_custom_plugins,['z0mbix/vim-shfmt',{ 'on_ft': 'sh' }])
  end
  if executable('just')
    call SpaceVim#logger#info("[ init#before ] 'just' binary detected. Adding associated vim plugin")
    call add(g:spacevim_custom_plugins,['vmchale/just-vim',{ 'on_ft': 'justfile' }])
  end
  if executable('sudo')
    call SpaceVim#logger#info("[ init#before ] 'sudo' binary detected. Adding associated layer")
    let g:spacevim_layers['sudo']={}
  end
  if executable('fzf')
    call SpaceVim#logger#info("[ init#before ] 'fzf' binary detected. Adding associated layer")
    let g:spacevim_layers['fzf']={}
    call add(g:coc_global_extensions,'coc-fzf-preview')
  end
  call before#spacevim#generic#bootstrap()
  if has('nvim')
    " call before#spacevim#filemanager#defx()
    call before#spacevim#filemanager#chadtree()
  else
    call before#spacevim#filemanager#coc_explorer()
  end
  call before#spacevim#nvim#bootstrap()
  call before#spacevim#mapping#bootstrap()
  call before#spacevim#tasks#bootstrap()
  call before#spacevim#xclip#bootstrap()
  call before#spacevim#themes#bootstrap()
" ─── LANGUAGE SPECIFIC CONFIGURATION ────────────────────────────────────────────
  call before#lang#go#bootstrap()
  call before#lang#docker#bootstrap()
  call before#lang#sh#bootstrap()
  call before#lang#vim#bootstrap()
  call before#lang#ruby#bootstrap()
  call before#lang#python#bootstrap()
  call before#lang#rust#bootstrap()
  call before#lang#markdown#bootstrap()
  call before#lang#json#bootstrap()
  call before#lang#yaml#bootstrap()
" ─── LOAD AND CONFIGURE SPACEVIM LAYERS ─────────────────────────────────────────
  call before#layers#autocomplete#bootstrap()
  call before#layers#checkers#bootstrap()
  call before#layers#format#bootstrap()
  call before#layers#gtags#bootstrap()
  call before#layers#shell#bootstrap()
  call before#layers#lsp#bootstrap()
  for layer in keys(g:spacevim_layers)
    call SpaceVim#logger#info("[ init#before ] loading '" . layer . "' spacevim layer")
    let l:config=g:spacevim_layers[layer]
    call SpaceVim#layers#load(layer,l:config)
  endfor
endfunction
function! init#after() abort
  call SpaceVim#logger#info("[ init#after ] function called")
  call after#coc#setup#bootstrap()
  set showcmd
  nnoremap <silent> [Window]a :cclose<CR>:lclose<CR>
endfunction
