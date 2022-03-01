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

To install, clone the repository and run `./install`. This will install the Vim
themes along with all the extras.

To install a specific component instead of everything, pass any of the
following flags:
```
./install usage:
  -a|--alacritty   install alacritty files
  -g|--gitk        install gitk files
  -k|--kitty       install kitty files
  -n|--neovim      install neovim files
  -t|--tmux        install tmux files
  -v|--vim         install vim files
  -h|--help        print this message
```

To uninstall, use `./uninstall`. The same program-specific flags in the
installation script apply here.


## Configuration

### Vim / Neovim

For Vim, edit your `.vimrc` file to contain:
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

For Neovim, edit the `.config/nvim/init.vim` file instead.

**Note:** If Vim is invoked as root or via the EDITOR environmental variable by
a program running as root (e.g. `visudo`), you may need to install colorific to
the root Vim directory. To do so, run `./install` while root and edit the
/root/.vimrc (or /root/.config/nvim/init.vim) as described above.

### Airline

Colorific can also be used to color the airline bar. Load the theme by adding
to your vimrc (for Vim) or init.vim (for Neovim):
```
let g:airline_theme='colorific'
```

**Note** For root, edit /root/.vimrc or /root/.config/nvim/init.vim as
applicable.


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

### alacritty

Running the install script (either `./install` or `./install -a` will copy the
YAML theme file in alacritty/ to ~/.config/alacritty.

To enable a theme, edit your alacritty config file to include:
```
import:
 - ~/.config/alacritty/colorific.yml
```

To load a particular theme, edit the ~/.config/alacritty/colorific.yml file and
change the value of `colors` at the bottom to the desired variant (e.g.
`*dark2`, `*light2`, etc.)

### gitk

The gitk stylings are installed by running `./install` or running `./install
-g`. This only copies all the gitk-\* variants in the git/ directory of this
repository to ~/.config/git/.

To actually load a theme, copy/rename/move one of these installed variants to
~/.config/git/gitk. The file name _must_ be 'gitk.'

## kitty

The installation script (run either `./install` or `./install -k`) copies the
kitty themes in kitty/ to a directory called ~/.config/kitty/themes.

To enable a particular theme, edit the kitty.conf file to have:
```
include ./themes/<theme>.conf
```
where `<theme>` corresponds to one of the available variants (e.g. `dark2`,
`light2`, etc.).

### tmux

Themes for tmux are available in the tmux/ directory. They are installed to the
~/.tmux directory when running `./install` or `./install -t`. To use them, edit
the ~/.tmux.conf file to have the line:
```
source-file <path>/<to>/<theme>.tmuxtheme
```

where `<theme>` refers to one of the available variants (`light3`, `dark3`,
`light2`, `dark2`, `dark`, or `light`).
