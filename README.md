# colorific.vim

Vim theme (dark and light) built to produce readable diffs, unlike the default
theme, and clear syntax highlighting that doesn't use overly bright colors that
make your eyes bleed after prolonged use.

The theme comes with two color sets for 256-color (cterm) and truecolor
terminals. 16-color ones are unsupported, and the theme will not work with
them. To use truecolor (e.g., #ABC123) support, make sure that you have `set
termguicolors` in your vimrc.

Syntax highlighting uses material colors manually tweaked to lower the
saturation and brightness. Why material colors? Because when you try to find
good highlighting colors out of all the colors available, it helps to have a
starting point.

The theme comes in three light and dark UI variants that correspond to some
prominent GTK themes:

- `light` and `dark` use blue-grey primary colors to match those used in the
  [Adapta GTK theme](https://github.com/adapta-project/adapta-gtk-theme).
- `light2` and `dark2` use white and black for starker contrast, similar to the
  [Plata](https://gitlab.com/tista500/plata-theme) and
  [Materia](https://github.com/nana-4/materia-theme) GTK themes.
- `light3` and `dark3` use the off-blue and greyish colors from the
  [Arc GTK theme](https://github.com/jnsh/arc-theme). Contrast between colors
  is too low for good cterm support, so make sure truecolor support is enabled.

Note that colorific will not override the system background color, so pick the
variant that looks best with your system theme.

Another point worth noting is that this theme overrides some of the Vim syntax
highlighter defaults for various languages so that coloration appears more
consistent across them.


## Installation

To install, clone the repository and run `./install`.

To install the theme as root, run `sudo ./install` instead.

To uninstall, use `./uninstall`.


## Configuration

### Vim

Add the following lines to your vimrc:
```
let g:colorific_style='<style>'
colo colorific
set background=<bg>
syntax on
```

- `<style>` is the name of the theme to load. Possible values are `light`,
  `light2`, `light3`, `dark`, `dark2`, `dark3`.

- `<bg>` refers to the background color of your terminal or system theme. Set
  it to `light` for a light background and `dark`for a dark one.

### Airline

Colorific can also be used to color the airline bar. Load the theme by adding
to your vimrc:
```
let g:airline_theme='colorific'
```

Note that if Vim is invoked as root, colorific needs to be loaded in
/root/.vimrc.


## Examples

|            | Light                              | Dark                              |
| :---:      | :---:                              | :---:                             |
| CSS        | ![CSS](assets/css-light.png)       | ![CSS](assets/css-dark.png)       |
| HTML       | ![HTML](assets/html-light.png)     | ![HTML](assets/html-dark.png)     |
| XML        | ![XML](assets/xml-light.png)       | ![XML](assets/xml-dark.png)       |
| Ruby       | ![Ruby](assets/ruby-light.png)     | ![Ruby](assets/ruby-dark.png)     |
| Python     | ![Python](assets/python-light.png) | ![Python](assets/python-dark.png) |
| C/C++      | ![C++](assets/cpp-light.png)       | ![C++](assets/cpp-dark.png)       |
| R          | ![R](assets/r-light.png)           | ![R](assets/r-dark.png)           |
| Julia      | ![Julia](assets/julia-light.png)   | ![Julia](assets/julia-dark.png)   |
| Perl       | ![Perl](assets/perl-light.png)     | ![Perl](assets/perl-dark.png)     |
| Javascript | ![Javascript](assets/js-light.png) | ![Javascript](assets/js-dark.png) |
| Bash       | ![Bash](assets/bash-light.png)     | ![Bash](assets/bash-dark.png)     |
| LaTeX      | ![LaTeX](assets/latex-light.png)   | ![LaTeX](assets/latex-dark.png)   |


## Extras

### gitk

Stylings for gitk are available in the gitk/ directory. To set a gitk theme,
copy the file for the desired theme (e.g. gitk-dark2) to a file called
~/.config/git/gitk. The file name _must_ be 'gitk.' Symlinks would work, too.

Note that the `install` script will install all four variants with names
unchanged to ~/.config/git/. To pick one, simply rename/symlink the file.


### tmux

Themes for tmux are available in the tmux/ directory. To use them, edit your
.tmux.conf file to have the line:

```
source-file <path>/<to>/<theme>.tmuxtheme
```

where `<theme>` refers to one of the available variants (light3, dark3, light2,
dark2, dark, or light).

Note that the `install` script will copy the themes in tmux/ to the ~/.tmux/
directory. No files need to be renamed for tmux.
