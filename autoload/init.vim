let g:spacevim_custom_plugins = [
  \ ['jvirtanen/vim-hcl',{ 'on_ft' : 'hcl'}],
  \ ['mboughaba/i3config.vim',{ 'on_ft' : ['i3','i3config']}],
  \ ['neoclide/coc.nvim'],
  \ ['mg979/vim-visual-multi'],
  \ ['will133/vim-dirdiff'],
  \ ['tarekbecker/vim-yaml-formatter'],
  \ ['machakann/vim-highlightedyank'],
  \ ['sheerun/vim-polyglot'],
\ ]
let g:spacevim_layers=[
  \ 'colorscheme',
  \ 'tools',
  \ 'ctrlspace',
  \ 'ui',
  \ 'git',
  \ 'github',
  \ 'foldsearch',
  \ 'core#statusline',
  \ 'lang#extra',
  \ 'lang#markdown',
  \ 'lang#toml',
  \ 'lang#json',
  \ 'lang#yaml',
\]
let g:coc_extensions = [
  \ 'coc-marketplace',
  \ 'coc-markdownlint',
  \ 'coc-tabnine',
  \ 'coc-todolist',
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts',
  \ 'coc-grammarly',
  \ 'coc-json',
  \ 'coc-format-json',
  \ 'coc-yaml',
  \ 'coc-tasks',
  \ 'coc-reveal',
\]
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
    call add(g:spacevim_layers,'sudo')
  end
  if executable('fzf')
    call SpaceVim#logger#info("[ init#before ] 'fzf' binary detected. Adding associated layer")
    call add(g:spacevim_layers,'fzf')
    call add(g:coc_extensions,'coc-fzf-preview')
  end
  call before#spacevim#generic#bootstrap()
  " call before#spacevim#filemanager#defx()
  call before#spacevim#filemanager#chadtree()
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
" ─── LOAD AND CONFIGURE SPACEVIM LAYERS ─────────────────────────────────────────
  call before#layers#autocomplete#bootstrap()
  call before#layers#checkers#bootstrap()
  call before#layers#format#bootstrap()
  call before#layers#gtags#bootstrap()
  call before#layers#lsp#bootstrap()
  call before#layers#shell#bootstrap()
  for layer in g:spacevim_layers
    call SpaceVim#logger#info("[ init#before ] loading ****'" . layer . "' spacevim layer")
    call SpaceVim#layers#load(layer)
  endfor
endfunction
function! init#after() abort
  call SpaceVim#logger#info("[ init#after ] function called")
  call after#coc#install#bootstrap()
  set showcmd
  nnoremap <silent> [Window]a :cclose<CR>:lclose<CR>
endfunction
function! PrintCocExtensions()
	for plugin in g:coc_extensions
		echon plugin " "
	endfor
endfunction
