" Vim syntax file
" Language: Stylus
" Maintainer: Marc Harter
" Filenames: *.styl, *.stylus
" Based On: Tim Pope (sass.vim)

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

" Author: Hsiaoming Young (sopheryoung@gmail.com)
" CSS3 Syntax Adapted From: CSS3.vim - http://www.vim.org/scripts/script.php?script_id=3042
syn keyword cssTagName article aside audio bb canvas command datagrid
syn keyword cssTagName datalist details dialog embed figure footer
syn keyword cssTagName header hgroup keygen mark meter nav output
syn keyword cssTagName progress time ruby rt rp section time video
syn keyword cssCommonAttr contained contenteditable contextmenu draggable hidden item
syn keyword cssCommonAttr contained itemprop list subject spellcheck
syn match cssUIProp contained "\<box-sizing\>"
syn match cssUIProp contained "\<outline-\(width\|style\|offset\|color\)\>"
syn match cssUIProp contained "\<nav-\(index\|up\|right\|down\|left\)\>"
syn keyword cssUIProp contained resize outline
syn keyword cssCommonAttr contained columns
syn match cssCommonAttr contained "\<column-\(width\|span\|rule\|gap\|fill\|count\)\>"
syn match cssCommonAttr contained "\<column-rule-\(color\|width\|style\)\>"
syn match cssCommonAttr contained "\<column-break-\(after\|before\)\>"
syn match cssBoxProp "\<border-\(image\|radius\)\=\>" contained
syn match cssBoxProp "\<\(box-shadow\)\>" contained
syn keyword cssColorProp contained opacity
syn match cssTextAttr contained "\<text-shadow\|text-overflow\|word-wrap\>"
syn match cssColorProp contained "\<background\(-\(origin\|clip\|size\)\)\="
syn match cssColor contained "\<rgb\s*(\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*)"
syn match cssColor contained "\<rgba\s*(\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*)"
syn match cssColor contained "\<hsl\s*(\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*)"
syn match cssColor contained "\<hsla\s*(\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*)"
syn match cssTextProp contained "\<word-wrap\>"
syn match cssTextProp contained "\<break-word\>"
syn match cssTextProp contained "\<break-all\>"
syn match cssTextProp contained "\<text-overflow\>"
syn match cssBoxProp contained "\<box-sizing\>"
syn match cssBoxProp contained "\<border-image\>"
syn match cssBoxProp contained "\<border-\(\(top-left\|top-right\|bottom-right\|bottom-left\)-radius\)\>"
" end CSS3 support

syn case ignore
syn region cssInclude start="@import" end="\n" contains=cssComment,cssURL,cssUnicodeEscape,cssMediaType
syn cluster stylusCssAttributes contains=css.*Attr,stylusComment,cssValue.*,cssColor,cssURL,sassDefault,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssRenderProp

syn region stylusDefinition matchgroup=cssBraces start="{" end="}" contains=TOP
syn match stylusProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+:" contains=css.*Prop skipwhite nextgroup=stylusCssAttribute contained containedin=stylusDefinition

syn match stylusProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+:\?\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=stylusCssAttribute
syn match stylusVariableAssignment "\%([[:alnum:]_-]\+\s*\)\@<==" nextgroup=stylusCssAttribute,stylusVariable skipwhite

syn match stylusCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@stylusCssAttributes,stylusFunction,stylusVariable,stylusControl,stylusUserFunction

syn match stylusUserFunction "^\s*\%([[:alnum:]_-]\+\)(\@="
syn match stylusUserFunction "\<\%([^)]*\)\>(\@=" contained

syn match stylusFunction "\<\%(red\|green\|blue\|alpha\|dark\|light\)\>(\@=" contained
syn match stylusFunction "\<\%(hue\|saturation\|lightness\|typeof\|unit\|match\)\>(\@=" contained
syn match stylusFunction "\<\%(hsla\|hsl\|rgba\|rgb\|lighten\|darken\|lighten-by\|darken-by\)\>(\@=" contained
syn match stylusFunction "\<\%(abs\|ceil\|floor\|round\|min\|max\|even\|odd\|sum\|avg\|join\)\>(\@=" contained
syn match stylusFunction "\<\%(desaturate\|saturate\|unquote\|quote\)\>(\@=" contained
syn match stylusFunction "\<\%(operate\|length\|warn\|error\|last\|p\|\)\>(\@=" contained
syn match stylusFunction "\<\%(opposite-position\|image-size\)\>(\@=" contained

syn keyword stylusVariable null true false arguments
syn keyword stylusControl  if else unless for in return

syn keyword stylusTodo       FIXME NOTE TODO OPTIMIZE XXX contained

syn region  stylusComment    start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ keepend contains=stylusTodo,@Spell fold
syn region  stylusCssComment start="/\*"  end="\*/" contains=stylusTodo,@Spell fold

hi def link stylusCssComment            Comment
hi def link stylusComment               Comment
hi def link stylusTodo                  Todo
hi def link stylusVariable              Identifier
hi def link stylusControl               PreProc
hi def link stylusUserFunction          PreProc
hi def link stylusFunction              Function
hi def link sassInterpolationDelimiter  Delimiter

let b:current_syntax = "stylus"

" vim:set sw=2:
