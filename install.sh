#! /bin/bash
set -eu

vimdir=${HOME}/.vim

mkdir -p ${vimdir}/colors ${vimdir}/autoload/airline/themes
cp -f colors/* ${vimdir}/colors/
cp -f autoload/airline/themes/* ${vimdir}/autoload/airline/themes/
