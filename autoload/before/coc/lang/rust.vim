function! before#coc#lang#rust#load()
  let l:function_name=substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  let l:base_log_msg='< ' . function_name . ' > '
  call SpaceVim#logger#info(l:base_log_msg.'function called.')
  
  if (executable('rustup') && executable('rust-analyzer')) || executable('cargo')
    call SpaceVim#logger#info(l:base_log_msg.'adding associated plugins and configuration.')
    let g:coc_preferences['rust-analyzer.updates.askBeforeDownload']=v:false
    let g:coc_preferences['rust-analyzer.checkOnSave.allTargets']=v:true
    let g:coc_preferences['rust-analyzer.checkOnSave.enable']=v:true
    let g:coc_preferences['rust-analyzer.diagnostics.enable']=v:true
    let g:coc_preferences['rust-analyzer.callInfo.full']=v:true
    let g:coc_preferences['rust-analyzer.completion.addCallParenthesis']=v:true
    let g:coc_preferences['rust-analyzer.completion.addCallArgumentSnippets']=v:true
    let g:coc_preferences['rust-analyzer.inlayHints.typeHints']=v:true
    let g:coc_preferences['rust-analyzer.inlayHints.parameterHints']=v:true
    let g:coc_preferences['rust-analyzer.inlayHints.chainingHints']=v:true
    let g:coc_preferences['rust-analyzer.inlayHints.maxLength']=50
    let g:coc_preferences['rust-analyzer.checkOnSave.command']='clippy'
    let g:coc_preferences['rust-analyzer.updates.channel']='stable'
    let g:coc_preferences['rust-analyzer.trace.extension']=v:true
  endif
endfunction
