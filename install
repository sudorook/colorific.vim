#! /bin/bash
set -eu

ROOT="$(dirname "${0}")"

VIMDIR=${HOME}/.vim
mkdir -vp "${VIMDIR}/colors" "${VIMDIR}/autoload/airline/themes"
cp -vf "${ROOT}"/colors/colorific.vim "${VIMDIR}/colors/"
cp -vf "${ROOT}"/autoload/airline/themes/colorific.vim "${VIMDIR}/autoload/airline/themes/"

GITDIR=${HOME}/.config/git
mkdir -vp "${GITDIR}"
cp -vf "${ROOT}"/git/gitk-{light,light2,light3,dark,dark2,dark3} "${GITDIR}/"

TMUXDIR=${HOME}/.tmux
mkdir -vp "${TMUXDIR}"
cp -vf "${ROOT}"/tmux/{light,light2,light3,dark,dark2,dark3}.tmuxtheme "${TMUXDIR}/"
