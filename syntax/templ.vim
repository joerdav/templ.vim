" Vim syntax file
" Language: templ

" syn region templCss start=/{% css .* %}/ keepend end=/{% endcss %}/ contains=cssTagName,cssAttributeSelector,cssClassName,cssIdentifier,cssAtRule,cssAttrRegion,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssCustomProp,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks,cssNoise

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'templ'
endif

syn include @html syntax/html.vim
unlet b:current_syntax

syn include @css syntax/css.vim
unlet b:current_syntax

syn include @go syntax/go.vim
unlet b:current_syntax

runtime! syntax/go.vim
unlet b:current_syntax

" templ
syn match templTemplateDec    /^templ/ nextgroup=templReceiverDecl,templFunction skipwhite skipnl
syn match templReceiverDecl      /(\s*\zs\%(\%(\w\+\s\+\)\?\*\?\w\+\%(\[\%(\%(\[\]\)\?\w\+\%(,\s*\)\?\)\+\]\)\?\)\ze\s*)/ contained contains=goReceiverVar,goReceiverType,goPointerOperator nextgroup=templFunction skipwhite skipnl
syn match templFunction          /\w\+/ nextgroup=templSimpleParams,templTypeParams contained skipwhite skipnl
syn match templSimpleParams      /(\%(\w\|\_s\|[*\.\[\],\{\}<>-]\)*)/ contained contains=goParamName,goType nextgroup=templTemplateBlock skipwhite skipnl
syn match templTypeParams        /\[\%(\w\+\s\+\%(\~\?\%(\[]\)\?\w\%(\w\||\)\)*\%(,\s*\)\?\)\+\]/ nextgroup=templSimpleParams contained skipwhite skipnl
syn region templTemplateBlock start="{" end="}" contains=@html,templCall,@templFlows,templTemplateBlock contained skipwhite skipnl

" @template()
syn match templCall /@/ nextgroup=templFunction contained skipwhite skipnl


" for ...
syn cluster templFlows contains=templFlow,templSwitch
syn match templFlow /\(for\|if\)/ contained skipwhite skipnl nextgroup=templFlowBlock
syn match templSwitch /switch/ contained skipwhite skipnl nextgroup=templSwitchBlock
syn keyword templSwitchKeyword case contained
syn keyword templSwitchKeyword default contained
syn region templSwitchBlock start=/.*{/ end="}" contained skipwhite skipnl contains=@html,templCall,@templFlows,templSwitchKeyword
syn region templFlowBlock start=/.*{/ end="}" contained skipwhite skipnl contains=@html,templCall,@templFlows


hi def link templTemplateDec Keyword
hi def link templFlow Keyword
hi def link templSwitch Keyword
hi def link templSwitchKeyword Keyword
hi def link templCall Special

let b:current_syntax = "templ"
