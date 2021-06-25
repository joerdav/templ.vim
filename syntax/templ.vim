" Vim syntax file
" Language: templ

" syn region templCss start=/{% css .* %}/ keepend end=/{% endcss %}/ contains=cssTagName,cssAttributeSelector,cssClassName,cssIdentifier,cssAtRule,cssAttrRegion,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssCustomProp,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks,cssNoise

if exists("b:current_syntax")
  finish
endif





ru! syntax/css.vim
ru! syntax/html.vim
unlet b:current_syntax

syn include @go syntax/go.vim

syn cluster templBlocks add=templExpression,templStatement,templTemplate

syn cluster templKeywords add=templConditional,templRepeat,templType
syn keyword templConditional contained if endif switch endswitch case endcase
syn keyword templRepeat contained for endfor
syn keyword templType contained templ endtempl css endcss

hi def link templConditional Conditional
hi def link templRepeat Repeat
hi def link templType Type

syn region templHtml start=/{% templ .* %}/ end="{% endtempl %}" keepend contains=htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,javaScript,@htmlPreproc
syn region templExpression start="{%=" end="%}" keepend contains=@go display containedin=ALLBUT,@templBlocks
syn region templStatement start="{%" end="%}" keepend contains=@go,@templKeywords display containedin=ALLBUT,@templBlocks
syn region templTemplate start="{%!" end="%}" keepend contains=@go display containedin=ALLBUT,@templBlocks
syn region templCss start=/{% css .* %}/ end="{% endcss %}" keepend contains=cssTagName,cssAttributeSelector,cssClassName,cssIdentifier,cssAtRule,cssAttrRegion,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssCustomProp,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks,cssNoise



syn cluster htmlPreproc add=templExpression

let b:current_syntax = "templ"
