function! before#lang#rust#bootstrap()
  call SpaceVim#logger#info("[ before#lang#rust#bootstrap ] function called.")
  if executable('rustup')
    call SpaceVim#logger#info("[ before#spacevim#rust#bootstrap ] rustup detected.adding associated plugins and configuration.")
    let g:spacevim_layers['lang#rust']={}
    let g:lsp_servers['rust']='rustup'
    let g:lsp_override_cmd['rust']=["rustup", "run", "nightly", "rust-analyzer"]
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
  end
endfunction
