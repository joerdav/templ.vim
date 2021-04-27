" Vim syntax file
" Language: templ
runtime! syntax/html.vim
unlet b:current_syntax

" Include Go highlighting in @Go cluster
syn include @Go syntax/go.vim

" templ keywords
syn cluster templGroup contains=templStart,templEnd,templEndBlocks,templCall
syn keyword templStart contained templ
syn keyword templEnd contained endtempl
syn keyword templCall contained call
syn keyword templEndBlocks contained endif endfor

hi def link templStart Statement
hi def link templCall Statement
hi def link templEnd Statement
hi def link templEndBlocks Statement

" templ code blocks
syn region templStatementBlock matchgroup=templTag start="{%" keepend end="%}" contains=@templGroup,@Go
syn region templExpresssionBlock matchgroup=templTag start="{%=" keepend end="%}" contains=@Go

" Allow templ expression within html
syn cluster htmlPreproc add=templExpressionBlock

let b:current_syntax = "templ"


