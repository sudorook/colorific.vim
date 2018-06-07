#! /bin/bash
set -eu

vimdir=${HOME}/.vim

mkdir -vp ${vimdir}/colors ${vimdir}/autoload/airline/themes
cp -vf colors/* ${vimdir}/colors/
cp -vf autoload/airline/themes/* ${vimdir}/autoload/airline/themes/

gitkdir=${HOME}/.config/gitk
mkdir -vp ${gitkdir}
cp -vf gitk/gitk ${gitkdir}/
