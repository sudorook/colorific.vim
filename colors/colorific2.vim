" ============================================================================
" Name:     Colorific vim color scheme
" Author:   sudorook <daemon@nullcodon.com>
" Version:  0.0.2
" ----------------------------------------------------------------------------
"
" Light and dark color scheme for GUI and 256 color terminal. Will maybe add
" support for 16-color terminals later.
"
" Forked mostly from Lucius color scheme, with some of Darkburn mixed in. The
" basic idea is to write a theme that looks better than the default,
" especially when viewing diffs, withough overriding the system background
" color. To do so, I had to scrap all the nifty colormap originally in Lucius.
" I also cut out all the contrast modes.
"
" https://github.com/sudorook/colorific2.vim
"
" To use the presets, you just need to set the color scheme first. In your
" vimrc, you can just do this:
"
"   colorscheme colorific2
"   set background=light
"
" You can also set backgound=dark for dark windows.
"
"
" Options:
"
" The presets available cover most of the options. You can, however, customize
" things by setting the following variables yourself:
"
" g:colorific2_style  (default: 'dark')
"
" Set this option to either 'light' or 'dark' for your desired color scheme.
" It has the same effect as setting the background.
"
" g:colorific2_use_bold (default: 1)
"
" Setting this will cause the color scheme to use bold fonts for some items.
"
" g:colorific2_use_underline (default: 1)
"
" Setting this will cause the color scheme to use underlined fonts for some
" items.
"
" ============================================================================



" ============================================================================
" Options:
" ============================================================================

unlet! g:colors_name
hi clear
if exists("syntax_on")
  syntax reset
endif

if exists("g:colorific2_style")
  let s:style = g:colorific2_style
else
  let s:style = &background
endif

if exists("g:colorific2_use_bold")
  let s:use_bold = g:colorific2_use_bold
else
  let s:use_bold = 1
endif

if exists("g:colorific2_use_underline")
  let s:use_underline = g:colorific2_use_underline
else
  let s:use_underline = 1
endif


" ============================================================================
" Text Groups:
" ============================================================================

let s:normal_items = [
  \  "Boolean", "Character", "ColorColumn", "Comment", "Conditional",
  \  "Constant", "cssBraces", "cssColor", "Cursor", "CursorColumn",
  \  "CursorLine", "CursorLineNr", "Debug", "Define", "Delimiter", "DiffAdd",
  \  "DiffChange", "DiffDelete", "Directory", "Error", "ErrorMsg", "Exception",
  \  "Float", "Function", "GitGutterAdd", "GitGutterChange",
  \  "GitGutterChangeDelete", "GitGutterDelete", "htmlArg", "htmlEndTag",
  \  "htmlTag", "htmlTagName", "Identifier", "Include", "IncSearch",
  \  "javaScriptBraces", "javaScriptNumber", "Keyword", "Label", "LineNr",
  \  "Macro", "markdownCode", "markdownUrl", "markdownUrlTitle", "ModeMsg",
  \  "MoreMsg", "NERDTreeDirSlash", "NERDTreeExecFile", "NonText", "Number",
  \  "Pmenu", "PmenuSbar", "PmenuSel", "PmenuThumb", "PreCondit", "PreProc",
  \  "Question", "Repeat", "sassFor", "sassMixin", "sassMixinName",
  \  "sassMixing", "sassWarn", "Search", "shFunctionKey", "shLoop",
  \  "SignColumn", "Special", "SpecialChar", "SpecialComment", "SpecialKey",
  \  "Statement", "StatusLineNC", "TabLine", "TabLineFill", "Tag", "Todo",
  \  "Type", "TypeDef", "VertSplit", "Visual", "WarningMsg", "WildMenu",
  \ ]

let s:bold_items = [
  \   "DiffText", "FoldColumn", "Folded", "MatchParen", "StatusLine",
  \   "TabLineSel", "Title",
  \ ]

let s:underline_items = [
  \   "Underlined", "VisualNOS"
  \ ]

let s:undercurl_items = [
  \   "SpellBad", "SpellCap", "SpellLocal", "SpellRare"
  \ ]


" ============================================================================
" Color Definitions:
" ============================================================================

" ----------------------------------------------------------------------------
" 'Normal' Colors:
" ----------------------------------------------------------------------------

hi clear Normal
hi Normal gui=none cterm=none term=none

"Without parsing contrast

if s:style == "light"
  hi Normal         guifg=#2e2e2e ctermfg=236
                          "^^^^^^ not 8bit
else
  hi Normal         guifg=#e3e3e3 ctermfg=254
                          "^^^^^^ not 8bit
endif


" ----------------------------------------------------------------------------
" Extra setup
" ----------------------------------------------------------------------------

exec "set background=" . s:style

" Clear default settings
for s:item in s:normal_items + s:bold_items + s:underline_items + s:undercurl_items
  exec "hi " . s:item . " guifg=NONE guibg=NONE gui=none"
              \ . " ctermfg=NONE ctermbg=NONE cterm=none term=none"
endfor

let g:colors_name="colorific2"


" ----------------------------------------------------------------------------
" Text Markup:
" ----------------------------------------------------------------------------

" If you don't know what a specific group does, :help highlight-group works
" wonders.

hi ModeMsg          guifg=fg
hi Question         guifg=fg
if s:style == "light"
  " Default groups
  hi Boolean                          guifg=#00b8d4 ctermfg=38
  hi Character                        guifg=#039be5 ctermfg=39
  hi Comment                          guifg=#949494 ctermfg=246
  hi Conditional                      guifg=#ef6c00 ctermfg=202
  hi Constant                         guifg=#00b8d4 ctermfg=38
  hi Debug                            guifg=#d500f9 ctermfg=165
  hi Define                           guifg=#00a143 ctermfg=35
  hi Delimiter                        guifg=#7e57c2 ctermfg=97
  hi Directory                        guifg=#2196f3 ctermfg=33
  hi Exception                        guifg=#d500f9 ctermfg=165
  hi Float                            guifg=#e53935 ctermfg=203
  hi Function                         guifg=#cc8a06 ctermfg=172
  hi Identifier                       guifg=#ff3d00 ctermfg=202
  hi Include                          guifg=#ff4081 ctermfg=204
  hi Keyword                          guifg=#00a143 ctermfg=35
  hi Label                            guifg=#ff3d00 ctermfg=202
  hi Macro                            guifg=#3f51b5 ctermfg=61
  hi NonText                          guifg=#303f9f ctermfg=60
  hi Number                           guifg=#e53935 ctermfg=203
  hi Operator                         guifg=#cc8a06 ctermfg=172
  hi PreCondit                        guifg=#3f51b5 ctermfg=61
  hi PreProc                          guifg=#3f51b5 ctermfg=61
  hi Repeat                           guifg=#ef6c00 ctermfg=202
  hi Special                          guifg=#0277bd ctermfg=31
  hi SpecialChar                      guifg=#0277bd ctermfg=31
  hi SpecialComment                   guifg=#0277bd ctermfg=31
  hi SpecialKey                       guifg=#0277bd ctermfg=31
  hi Statement                        guifg=#00a143 ctermfg=35
  hi StorageClass                     guifg=#0097a7 ctermfg=32
  hi String                           guifg=#039be5 ctermfg=39
  hi Structure                        guifg=#00838f ctermfg=30
  hi Tag                              guifg=#0097a7 ctermfg=32
  hi Title                            guifg=#2196f3 ctermfg=33
  hi Type                             guifg=#00838f ctermfg=30
  hi TypeDef                          guifg=#0097a7 ctermfg=32

  " Overrides
  hi link cssBraces Delimiter
  hi link cssColor Number
  hi GitGutterAdd                     guifg=#00c853 ctermfg=41   guibg=#ededed ctermbg=255
  hi GitGutterChange                  guifg=#ffab00 ctermfg=214  guibg=#ededed ctermbg=255
  hi GitGutterChangeDelete            guifg=#ff6d00 ctermfg=202  guibg=#ededed ctermbg=255
  hi GitGutterDelete                  guifg=#d50000 ctermfg=160  guibg=#ededed ctermbg=255
  hi link htmlArg Statement
  hi link htmlEndTag Type
  hi link htmlTag Tag
  hi link htmlTagName Function
  hi link javaScriptBraces Delimiter
  hi link javaScriptNumber Number
  hi markdownCode                     guifg=#f06292 ctermfg=204
  hi link markdownUrl String
  hi link markdownUrlTitle Special
  hi link NERDTreeDirSlash Normal
  hi NERDTreeExecFile                 guifg=#00c853 ctermfg=41
  hi link sassFor Repeat
  hi link sassMixin Include
  hi link sassMixinName String
  hi link sassMixing Include
  hi link sassWarn Debug
  hi link shFunctionKey Define
  hi link shLoop Repeat
else
  " Default groups
  hi Boolean                          guifg=#16e6e6 ctermfg=14
  hi Character                        guifg=#73c2e6 ctermfg=117
  hi Comment                          guifg=#949494 ctermfg=246
  hi Conditional                      guifg=#f29f24 ctermfg=214
  hi Constant                         guifg=#16e6e6 ctermfg=14
  hi Debug                            guifg=#d373e3 ctermfg=117
  hi Define                           guifg=#00cc68 ctermfg=42
  hi Delimiter                        guifg=#b39ddb ctermfg=146
  hi Directory                        guifg=#64b5f6 ctermfg=75
  hi Exception                        guifg=#d373e3 ctermfg=117
  hi Float                            guifg=#e34f4c ctermfg=203
  hi Function                         guifg=#d9cc64 ctermfg=228
  hi Identifier                       guifg=#d97c39 ctermfg=209
  hi Include                          guifg=#e35d8a ctermfg=205
  hi Keyword                          guifg=#00cc68 ctermfg=42
  hi Label                            guifg=#d97c39 ctermfg=209
  hi Macro                            guifg=#8596f2 ctermfg=111
  hi NonText                          guifg=#5c6bc0 ctermfg=61
  hi Number                           guifg=#e34f4c ctermfg=203
  hi Operator                         guifg=#d9cc64 ctermfg=228
  hi PreCondit                        guifg=#8596f2 ctermfg=111
  hi PreProc                          guifg=#8596f2 ctermfg=111
  hi Repeat                           guifg=#f29f24 ctermfg=214
  hi Special                          guifg=#3ab0e6 ctermfg=81
  hi SpecialChar                      guifg=#3ab0e6 ctermfg=81
  hi SpecialComment                   guifg=#3ab0e6 ctermfg=81
  hi SpecialKey                       guifg=#3ab0e6 ctermfg=81
  hi Statement                        guifg=#00cc68 ctermfg=42
  hi StorageClass                     guifg=#1bdbab ctermfg=86
  hi String                           guifg=#73c2e6 ctermfg=117
  hi Structure                        guifg=#00bfa5 ctermfg=43
  hi Tag                              guifg=#1bdbab ctermfg=86
  hi Title                            guifg=#64b5f6 ctermfg=75
  hi Type                             guifg=#00bfa5 ctermfg=43
  hi TypeDef                          guifg=#1bdbab ctermfg=86

  " Overrides
  hi link cssBraces Delimiter
  hi link cssColor Number
  hi GitGutterAdd                     guifg=#00e676 ctermfg=85   guibg=#1c1c1c ctermbg=234
  hi GitGutterChange                  guifg=#ffea00 ctermfg=11   guibg=#1c1c1c ctermbg=234
  hi GitGutterChangeDelete            guifg=#ff9100 ctermfg=215  guibg=#1c1c1c ctermbg=234
  hi GitGutterDelete                  guifg=#ff1744 ctermfg=203  guibg=#1c1c1c ctermbg=234
  hi link htmlArg Statement
  hi link htmlEndTag Type
  hi link htmlTag Tag
  hi link htmlTagName Function
  hi link javaScriptBraces Delimiter
  hi link javaScriptNumber Number
  hi markdownCode                     guifg=#f48fb1 ctermfg=211
  hi link markdownUrl String
  hi link markdownUrlTitle Special
  hi link NERDTreeDirSlash Normal
  hi NERDTreeExecFile                 guifg=#00e676 ctermfg=85
  hi link sassFor Repeat
  hi link sassMixin Include
  hi link sassMixinName String
  hi link sassMixing Include
  hi link sassWarn Debug
  hi link shFunctionKey Define
  hi link shLoop Repeat
endif


" ----------------------------------------------------------------------------
" Highlighting:
" ----------------------------------------------------------------------------

if s:style == "light"
  hi Error          guifg=#af0000 ctermfg=124  guibg=#d7afaf ctermbg=181
  hi IncSearch      guifg=fg                   guibg=#87ffff ctermbg=123
  hi MatchParen     guifg=NONE                 guibg=#b39ddb ctermbg=117
  hi Search         guifg=fg                   guibg=#ffd75f ctermbg=221
  hi Todo           guifg=#875f00 ctermfg=94   guibg=#ffffaf ctermbg=229
  hi Visual         guifg=#005f5f ctermfg=23   guibg=#e1f5f5 ctermbg=195
                                                     "^^^^^^ not 8bit
  hi VisualNOS      guifg=fg                   guibg=NONE
else
  hi Error          guifg=#ff8787 ctermfg=210  guibg=#870000 ctermbg=88
  hi IncSearch      guifg=#212121 ctermfg=235  guibg=#5fd7ff ctermbg=81
  hi MatchParen     guifg=#f0f0f0 ctermfg=231  guibg=#5e35b1 ctermbg=61
  hi Search         guifg=#212121 ctermfg=235  guibg=#d78700 ctermbg=172
  hi Todo           guifg=#d7d75f ctermfg=185  guibg=#5f5f00 ctermbg=58
  hi Visual         guifg=#87d7d7 ctermfg=116  guibg=#294040 ctermbg=23
                                                     "^^^^^^ not 8bit
  hi VisualNOS      guifg=fg                   guibg=NONE
endif


" ----------------------------------------------------------------------------
" Messages:
" ----------------------------------------------------------------------------

hi ModeMsg          guifg=fg
hi Question         guifg=fg
if s:style == "light"
  hi ErrorMsg       guifg=#af0000 ctermfg=124
  hi MoreMsg        guifg=#005fd7 ctermfg=26
  hi WarningMsg     guifg=#af5f00 ctermfg=130
else
  hi ErrorMsg       guifg=#ff5f5f ctermfg=203
  hi MoreMsg        guifg=#5fd7d7 ctermfg=80
  hi WarningMsg     guifg=#d7875f ctermfg=173
endif


" ----------------------------------------------------------------------------
" UI:
" ----------------------------------------------------------------------------

if s:style == "light"
  hi ColorColumn    guifg=NONE                 guibg=#d7d7af ctermbg=187
  hi Cursor         guifg=#f0f0f0 ctermfg=231  guibg=#5f87af ctermbg=67
                          "^^^^^^ not 8bit
  hi CursorColumn   guifg=NONE                 guibg=#ededed ctermbg=255
                                                     "^^^^^^ not 8bit
  hi CursorIM       guifg=#f0f0f0 ctermfg=231  guibg=#5f87af ctermbg=67
                          "^^^^^^ not 8bit
  hi CursorLine     guifg=NONE                 guibg=#ededed ctermbg=255
                                                     "^^^^^^ not 8bit
  hi CursorLineNr   guifg=#bdbdbd ctermfg=250  guibg=#ededed ctermbg=255
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi Folded         guifg=#474747 ctermfg=238  guibg=#e3e3e3 ctermbg=254
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi FoldColumn     guifg=#474747 ctermfg=238  guibg=#e3e3e3 ctermbg=254
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi LineNr         guifg=#949494 ctermfg=246  guibg=#ededed ctermbg=255
                                                     "^^^^^^ not 8bit
  hi Pmenu          guifg=#f0f0f0 ctermfg=231  guibg=#5c5c5c ctermbg=59
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi PmenuSbar      guifg=#5c5c5c ctermfg=59   guibg=#2e2e2e ctermbg=236
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi PmenuSel       guifg=fg                   guibg=#afd7ff ctermbg=153
  hi PmenuThumb     guifg=fg                   guibg=#bdbdbd ctermbg=250
  hi SignColumn     guifg=#474747 ctermfg=238  guibg=#e3e3e3 ctermbg=254
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi StatusLine     guifg=#f0f0f0 ctermfg=231  guibg=#545454 ctermbg=240
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi StatusLineNC   guifg=#545454 ctermfg=240  guibg=#ededed ctermbg=255
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi TabLine        guifg=#f0f0f0 ctermfg=231  guibg=#5c5c5c ctermbg=59
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi TabLineFill    guifg=#545454 ctermfg=240  guibg=#ededed ctermbg=255
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi TabLineSel     guifg=#f0f0f0 ctermfg=231  guibg=#afd7ff ctermbg=153
  hi VertSplit      guifg=#ededed ctermfg=255  guibg=#5c5c5c ctermbg=59
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi WildMenu       guifg=fg                   guibg=#afd7ff ctermbg=153
else
  hi ColorColumn    guifg=NONE                 guibg=#87875f ctermbg=101
  hi Cursor         guifg=#212121 ctermfg=235  guibg=#87afd7 ctermbg=110
                          "^^^^^^ not 8bit
  hi CursorColumn   guifg=NONE                 guibg=#1c1c1c ctermbg=234
  hi CursorIM       guifg=#212121 ctermfg=235  guibg=#87afd7 ctermbg=110
                          "^^^^^^ not 8bit
  hi CursorLine     guifg=NONE                 guibg=#1c1c1c ctermbg=234
  hi CursorLineNr   guifg=#545454 ctermfg=240  guibg=#1c1c1c ctermbg=234
                          "^^^^^^ not8bit
  hi Folded         guifg=#e4e4e4 ctermfg=254  guibg=#2e2e2e ctermbg=236
                                                     "^^^^^^ not 8bit
  hi FoldColumn     guifg=#e4e4e4 ctermfg=254  guibg=#2e2e2e ctermbg=236
                                                     "^^^^^^ not 8bit
  hi LineNr         guifg=#545454 ctermfg=244  guibg=#1c1c1c ctermbg=234
                          "^^^^^^ not 8bit
  hi Pmenu          guifg=#212121 ctermfg=235  guibg=#d0d0d0 ctermbg=252
                          "^^^^^^ not 8bit
  hi PmenuSbar      guifg=#c6c6c6 ctermfg=251  guibg=#e3e3e3 ctermbg=254
                                                     "^^^^^^ not 8bit
  hi PmenuSel       guifg=fg                   guibg=#005faf ctermbg=25
  hi PmenuThumb     guifg=fg                   guibg=#545454 ctermbg=244
  hi SignColumn     guifg=#c6c6c6 ctermfg=251  guibg=#2e2e2e ctermbg=236
                                                     "^^^^^^ not 8bit
  hi StatusLine     guifg=#212121 ctermfg=235  guibg=#d0d0d0 ctermbg=252
                          "^^^^^^ not 8bit
  hi StatusLineNC   guifg=#bdbdbd ctermfg=250  guibg=#1c1c1c ctermbg=234
                          "^^^^^^ not 8bit
  hi TabLine        guifg=#212121 ctermfg=235  guibg=#d0d0d0 ctermbg=252
                          "^^^^^^ not 8bit
  hi TabLineFill    guifg=#bdbdbd ctermfg=250  guibg=#1c1c1c ctermbg=234
                          "^^^^^^ not 8bit
  hi TabLineSel     guifg=fg                   guibg=#005faf ctermbg=25
  hi VertSplit      guifg=#474747 ctermfg=238  guibg=#d0d0d0 ctermbg=252
                          "^^^^^^ not 8bit
  hi WildMenu       guifg=fg                   guibg=#005faf ctermbg=25
endif


" ----------------------------------------------------------------------------
" Diff:
" ----------------------------------------------------------------------------

hi DiffAdd          guifg=fg
hi DiffChange       guifg=fg
hi DiffDelete       guifg=fg

if s:style == "light"
  hi DiffAdd                                   guibg=#aef2c4 ctermbg=151
                                                     "^^^^^^ not 8bit
  hi DiffChange                                guibg=#f2f2ae ctermbg=187
                                                     "^^^^^^ not 8bit
  hi DiffDelete                                guibg=#f2aeae ctermbg=181
                                                     "^^^^^^ not 8bit
  hi DiffText       guifg=#d75f00 ctermfg=166  guibg=#f2f2ae ctermbg=187
                                                     "^^^^^^ not 8bit
else
  hi DiffAdd                                   guibg=#2e543b ctermbg=65
                                                     "^^^^^^ not 8bit
  hi DiffChange                                guibg=#616134 ctermbg=101
                                                     "^^^^^^ not 8bit
  hi DiffDelete                                guibg=#613434 ctermbg=95
                                                     "^^^^^^ not 8bit
  hi DiffText       guifg=#f2f2a6 ctermfg=229  guibg=#616134 ctermbg=101
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
endif


" ----------------------------------------------------------------------------
" Spelling:
" ----------------------------------------------------------------------------

if s:style == "light"
  hi SpellBad       guisp=#dd2626 guifg=#dd2626 ctermfg=160
                          "^^^^^^        ^^^^^^ not 8bit
  hi SpellCap       guisp=#00afd7 guifg=#00afd7 ctermfg=38
  hi SpellLocal     guisp=#d7af00 guifg=#d7af00 ctermfg=178
  hi SpellRare      guisp=#5faf00 guifg=#5faf00 ctermfg=70
else
  hi SpellBad       guisp=#e66868 guifg=#e66868 ctermfg=167
                          "^^^^^^        ^^^^^^ not 8bit
  hi SpellCap       guisp=#00afd7 guifg=#00afd7 ctermfg=38
  hi SpellLocal     guisp=#d7af00 guifg=#d7af00 ctermfg=178
  hi SpellRare      guisp=#5faf00 guifg=#5faf00 ctermfg=70
endif


" ----------------------------------------------------------------------------
" Miscellaneous:
" ----------------------------------------------------------------------------

if s:style == "light"
  hi Ignore         guifg=#f0f0f0 ctermfg=255
                          "^^^^^^ not 8bit
else
  hi Ignore         guifg=#212121 ctermfg=235
                          "^^^^^^ not 8bit
endif
hi Underlined       guifg=fg


" ============================================================================
" Text Emphasis:
" ============================================================================

if s:use_bold == 1
  for s:item in s:bold_items
    exec "hi " . s:item . " gui=bold cterm=bold term=none"
  endfor
endif

if s:use_underline == 1
  for s:item in s:underline_items
    exec "hi " . s:item . " gui=underline cterm=underline term=none"
  endfor
  for s:item in s:undercurl_items
    exec "hi " . s:item . " cterm=underline"
  endfor
endif

for s:item in s:undercurl_items
  exec "hi " . s:item . " gui=undercurl term=none"
endfor


" ============================================================================
" Alternative Bold Definitions:
" ============================================================================

let s:alternative_bold_items = [
  \   "Identifier", "PreProc", "Statement", "Special", "Constant", "Type"
  \ ]

for s:item in s:alternative_bold_items
  exec "let s:temp_gui_fg = synIDattr(synIDtrans(hlID('" . s:item .
              \ "')), 'fg', 'gui')"
  exec "let s:temp_cterm_fg = synIDattr(synIDtrans(hlID('" . s:item .
              \ "')), 'fg', 'cterm')"
  exec "hi B" . s:item . " guifg=" . s:temp_gui_fg . " ctermfg=" .
              \ s:temp_cterm_fg . " gui=bold cterm=bold term=none"
endfor


" ============================================================================
" Plugin Specific Colors:
" ============================================================================

" Tagbar:
hi link TagbarAccessPublic Constant
hi link TagbarAccessProtected Type
hi link TagbarAccessPrivate PreProc

" Vimwiki:
hi link VimwikiHeader1 BIdentifier
hi link VimwikiHeader2 BPreProc
hi link VimwikiHeader3 BStatement
hi link VimwikiHeader4 BSpecial
hi link VimwikiHeader5 BConstant
hi link VimwikiHeader6 BType

" vim: tw=78

