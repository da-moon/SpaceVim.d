

" https://stackoverflow.com/a/5088562
" autocmd FileType vim map <leader>ccb I"<Del>  <Esc>A  "<Del><Esc>yyp0lv$hhr"yykPjj
" autocmd FileType javascript,php,c map <leader>ccb I//  <Esc>A  //<Esc>yyp0llv$hhhr-yykPjj
" autocmd FileType python,ruby,sh,zsh map <leader>ccb I#  <Esc>A  #<Esc>yyp0lv$hhr-yykPjj
" autocmd FileType css map <leader>ccb I/*  <Esc>A  */<Esc>yyp0llv$r-$hc$*/<Esc>yykPjj

function! CommentBanner(...)abort
  let line_width = 80
  let argChar = get(a: , 1, '─' )
  let argString = argChar
  let l:line=trim(getline("."))
  if strlen(l:line) != 0
    let argString = ' ' . toupper(l:line) . ' '
    let line_width = line_width - 2
    set paste
    exe ':normal dd'
    exe ':normal O'
    set nopaste
  endif
  let commentStart=' ' . argChar. argChar. argChar. argChar
  let result = substitute(&commentstring, "commentstring=", "", "")
  let resultList = split(result, "%s")
  let Comment = resultList[0]
  let nb = (line_width - strlen(argString) - strlen(commentStart) - len(Comment) )
  let i = 0
  let commentString = commentStart . argString
  while i < nb
    let i = i + 1
    let commentString = commentString . argChar
  endwhile
  " append one more char if necessary
  if strlen(argString) % 2 != 0
    let commentString = commentString . argChar
  endif
  let commentString = Comment . commentString
  set paste
  if strlen(l:line) != 0
    exe ':normal i' . Comment
    exe ':normal o'
  endif
  exe ':normal i' . commentString
  if strlen(l:line) != 0
    exe ':normal o'
    exe ':normal i' . Comment
  endif
  set nopaste
endfunction
call SpaceVim#custom#SPC('nore', ['c', 'b'], 'call CommentBanner()', 'create-comment-banner',1)
