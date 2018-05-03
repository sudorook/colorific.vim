# Colorific.vim

Vim theme (dark and light) to produce readable diffs (unlike the default) and
clear syntax highlighting without using overly bright colors that make your
eyes bleed after prolonged use.

The theme comes with two color sets for 256-color (cterm) and truecolor
terminals.  16-color ones are unsupported, and the theme will not work with
them. To use truecolor (e.g., #ABC123) support, make sure that you have `set
termguicolors` in your vimrc.

Note that the theme doesn't override the system background color, so it may
look odd in some themes. UI elements (Folds, FoldColumns, StatusLines, etc.)
use BlueGrey colors from Google's color palette, so colorific will look best
with themes that use those colors, like
[adapta](https://github.com/adapta-project/adapta-gtk-theme) for example.


## Installation

```
git clone https://github.com/sudorook/colorific.vim colorific.vim
mkdir -p ${HOME}/.vim/colors ${HOME}/.vim/autoload/airline/themes
cp -f colorific.vim/colors/colorific.vim ${HOME}/.vim/colors/
cp -f autoload/airline/themes/colorific.vim ${HOME}/.vim/autoload/airline/themes/
rm -rf colorific.vim/
```


## Configuration

Add the following lines to your vimrc:
```
colo colorific
set background=dark
```

Use `set background=light` if you use a light system theme.

If you are using airline, load the theme by adding to your vimrc:
```
let g:airline_theme='colorific'
```
