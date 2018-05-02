" ============================================================================
" Name:     Colorific vim color scheme
" Author:   sudorook <daemon@nullcodon.com>
" Version:  0.0.1
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
" https://github.com/sudorook/colorific.vim
"
" To use the presets, you just need to set the color scheme first. In your
" vimrc, you can just do this:
"
"   colorscheme colorific
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
" g:colorific_style  (default: 'dark')
"
" Set this option to either 'light' or 'dark' for your desired color scheme.
" It has the same effect as setting the background.
"
" g:colorific_use_bold (default: 1)
"
" Setting this will cause the color scheme to use bold fonts for some items.
"
" g:colorific_use_underline (default: 1)
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

if exists("g:colorific_style")
  let s:style = g:colorific_style
else
  let s:style = &background
endif

if exists("g:colorific_use_bold")
  let s:use_bold = g:colorific_use_bold
else
  let s:use_bold = 1
endif

if exists("g:colorific_use_underline")
  let s:use_underline = g:colorific_use_underline
else
  let s:use_underline = 1
endif


" ============================================================================
" Text Groups:
" ============================================================================

let s:normal_items = [
  \   "ColorColumn", "Comment", "Constant", "Cursor", "CursorColumn",
  \   "CursorLine", "CursorLineNr", "DiffAdd", "DiffChange", "DiffDelete",
  \   "Directory", "Error", "ErrorMsg", "Identifier", "IncSearch", "LineNr",
  \   "ModeMsg", "MoreMsg", "NonText", "Pmenu", "PmenuSbar", "PmenuSel",
  \   "PmenuThumb", "PreProc", "Question", "Search", "SignColumn", "Special",
  \   "SpecialKey", "Statement", "StatusLineNC", "TabLine", "TabLineFill",
  \   "Todo", "Type", "VertSplit", "Visual", "WarningMsg", "WildMenu",
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
  hi Normal         guifg=#444444 ctermfg=238
else
  hi Normal         guifg=#cfd8dc ctermfg=188
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

let g:colors_name="colorific"


" ----------------------------------------------------------------------------
" Text Markup:
" ----------------------------------------------------------------------------

hi ModeMsg          guifg=fg
hi Question         guifg=fg
if s:style == "light"
  hi Comment        guifg=#808080 ctermfg=244
  hi Constant       guifg=#af5f00 ctermfg=130
  hi Directory      guifg=#00875f ctermfg=29
  hi Identifier     guifg=#008700 ctermfg=28
  hi NonText        guifg=#afafd7 ctermfg=147
  hi PreProc        guifg=#008787 ctermfg=30
  hi Special        guifg=#870087 ctermfg=90
  hi SpecialKey     guifg=#afd7af ctermfg=151
  hi Statement      guifg=#005faf ctermfg=25
  hi Title          guifg=#005faf ctermfg=25
  hi Type           guifg=#005f87 ctermfg=24
else
  hi Comment        guifg=#808080 ctermfg=244
  hi Constant       guifg=#d7d7af ctermfg=187
  hi Directory      guifg=#afd7af ctermfg=151
  hi Identifier     guifg=#afd787 ctermfg=150
  hi NonText        guifg=#5f5f87 ctermfg=60
  hi PreProc        guifg=#87d7af ctermfg=115
  hi Special        guifg=#d7afd7 ctermfg=182
  hi SpecialKey     guifg=#5f875f ctermfg=65
  hi Statement      guifg=#87d7ff ctermfg=117
  hi Title          guifg=#5fafd7 ctermfg=74
  hi Type           guifg=#87d7d7 ctermfg=116
endif


" ----------------------------------------------------------------------------
" Highlighting:
" ----------------------------------------------------------------------------

if s:style == "light"
  hi Error          guifg=#af0000 ctermfg=124  guibg=#d7afaf ctermbg=181
  hi IncSearch      guifg=fg                   guibg=#87ffff ctermbg=123
  hi MatchParen     guibg=#5fd7d7 ctermfg=80
  hi Search         guifg=fg                   guibg=#ffd75f ctermbg=221
  hi Todo           guifg=#875f00 ctermfg=94   guibg=#ffffaf ctermbg=229
  hi Visual         guifg=#005f5f ctermfg=23   guibg=#e1f5f5 ctermbg=195
                                                     "^^^^^^ not 8bit
  hi VisualNOS      guifg=fg                   guibg=NONE
else
  hi Error          guifg=#ff8787 ctermfg=210  guibg=#870000 ctermbg=88
  hi IncSearch      guifg=#303030 ctermfg=236  guibg=#5fd7ff ctermbg=81
  hi MatchParen     guifg=#afd75f ctermfg=149
  hi Search         guifg=#303030 ctermfg=236  guibg=#d78700 ctermbg=172
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
  hi Cursor         guifg=#eeeeee ctermfg=255  guibg=#5f87af ctermbg=67
  hi CursorColumn   guifg=NONE                 guibg=#e4e4e4 ctermbg=254
  hi CursorIM       guifg=#eeeeee ctermfg=255  guibg=#5f87af ctermbg=67
  hi CursorLine     guifg=NONE                 guibg=#e4e4e4 ctermbg=254
  hi CursorLineNr   guifg=#9e9e9e ctermfg=247  guibg=#e4e4e4 ctermbg=254
  hi Folded         guifg=#606060 ctermfg=241  guibg=#d0d0d0 ctermbg=252
  hi FoldColumn     guifg=#606060 ctermfg=241  guibg=#d0d0d0 ctermbg=252
  hi LineNr         guifg=#8a8a8a ctermfg=245  guibg=#e4e4e4 ctermbg=254
  hi Pmenu          guifg=#eeeeee ctermfg=255  guibg=#808080 ctermbg=244
  hi PmenuSbar      guifg=#808080 ctermfg=244  guibg=#444444 ctermbg=238
  hi PmenuSel       guifg=fg                   guibg=#afd7ff ctermbg=153
  hi PmenuThumb     guifg=fg                   guibg=#9e9e9e ctermbg=247
  hi SignColumn     guifg=#606060 ctermfg=241  guibg=#d0d0d0 ctermbg=252
  hi StatusLine     guifg=#eeeeee ctermfg=255  guibg=#808080 ctermbg=244
  hi StatusLineNC   guifg=#767676 ctermfg=243  guibg=#e4e4e4 ctermbg=254
  hi TabLine        guifg=#eeeeee ctermfg=255  guibg=#808080 ctermbg=244
  hi TabLineFill    guifg=#767676 ctermfg=243  guibg=#e4e4e4 ctermbg=254
  hi TabLineSel     guifg=#eeeeee ctermfg=255  guibg=#afd7ff ctermbg=153
  hi VertSplit      guifg=#e4e4e4 ctermfg=254  guibg=#808080 ctermbg=244
  hi WildMenu       guifg=fg                   guibg=#afd7ff ctermbg=153
else
  hi ColorColumn    guifg=NONE                 guibg=#87875f ctermbg=101
  hi Cursor         guifg=#263238 ctermfg=235  guibg=#87afd7 ctermbg=110
                          "^^^^^^ not 8bit
  hi CursorColumn   guifg=NONE                 guibg=#2e3c44 ctermbg=236
                                                     "^^^^^^ not 8bit
  hi CursorIM       guifg=#263238 ctermfg=235  guibg=#87afd7 ctermbg=110
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi CursorLine     guifg=NONE                 guibg=#2e3c44 ctermbg=236
                                                     "^^^^^^ not 8bit
  hi CursorLineNr   guifg=#607d8b ctermfg=244  guibg=#2e3c44 ctermbg=236
                          "^^^^^^ not8bit            "^^^^^^ not 8bit
  hi Folded         guifg=#c0cbd0 ctermfg=250  guibg=#37474f ctermbg=237
                          "^^^^^^ not8bit            "^^^^^^ not 8bit
  hi FoldColumn     guifg=#c0cbd0 ctermfg=250  guibg=#37474f ctermbg=237
                          "^^^^^^ not8bit            "^^^^^^ not 8bit
  hi LineNr         guifg=#607d8b ctermfg=244  guibg=#2e3c44 ctermbg=236
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi Pmenu          guifg=#263238 ctermfg=235  guibg=#b0bec5 ctermbg=250
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi PmenuSbar      guifg=#b0b3c5 ctermfg=249  guibg=#cfd8dc ctermbg=252
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi PmenuSel       guifg=fg                   guibg=#005faf ctermbg=25
  hi PmenuThumb     guifg=fg                   guibg=#90a4ae ctermbg=244
  hi SignColumn     guifg=#b0b3c5 ctermfg=249  guibg=#37474f ctermbg=237
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi StatusLine     guifg=#263238 ctermfg=235  guibg=#b0bec5 ctermbg=249
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi StatusLineNC   guifg=#90a4ae ctermfg=246  guibg=#2e3c44 ctermbg=236
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi TabLine        guifg=#263238 ctermfg=235  guibg=#b0bec5 ctermbg=249
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi TabLineFill    guifg=#90a4ae ctermfg=246  guibg=#2e3c44 ctermbg=236
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi TabLineSel     guifg=fg                   guibg=#005faf ctermbg=25
  hi VertSplit      guifg=#607d8b ctermfg=241  guibg=#b0bec5 ctermbg=249
                          "^^^^^^ not 8bit           "^^^^^^ not 8bit
  hi WildMenu       guifg=fg                   guibg=#005faf ctermbg=25
endif


" ----------------------------------------------------------------------------
" Diff:
" ----------------------------------------------------------------------------

hi DiffAdd          guifg=fg
hi DiffChange       guifg=fg
hi DiffDelete       guifg=fg

if s:style == "light"
  hi DiffAdd                                   guibg=#c7f2d5 ctermbg=151
                                                     "^^^^^^ not 8bit
  hi DiffChange                                guibg=#f2f2c6 ctermbg=187
                                                     "^^^^^^ not 8bit
  hi DiffDelete                                guibg=#f2c6c6 ctermbg=181
                                                     "^^^^^^ not 8bit
  hi DiffText       guifg=#d75f00 ctermfg=166  guibg=#f2f2c6 ctermbg=187
                                                     "^^^^^^ not 8bit
else
  hi DiffAdd                                   guibg=#426e51 ctermbg=65
                                                     "^^^^^^ not 8bit
  hi DiffChange                                guibg=#7a7a49 ctermbg=101
                                                     "^^^^^^ not 8bit
  hi DiffDelete                                guibg=#7A4949 ctermbg=95
                                                     "^^^^^^ not 8bit
  hi DiffText       guifg=#ffff87 ctermfg=228  guibg=#7a7a49 ctermbg=101
                                                     "^^^^^^ not 8bit
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
  hi Ignore         guifg=#eeeeee ctermfg=255
else
  hi Ignore         guifg=#303030 ctermfg=236
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

