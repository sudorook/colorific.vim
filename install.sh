#! /bin/bash
set -eu

VIMDIR=${HOME}/.vim
mkdir -vp "${VIMDIR}/colors" "${VIMDIR}/autoload/airline/themes"
cp -vf colors/* "${VIMDIR}/colors/"
cp -vf autoload/airline/themes/* "${VIMDIR}/autoload/airline/themes/"

GITDIR=${HOME}/.config/git
mkdir -vp "${GITDIR}"
cp -vf git/gitk-* "${GITDIR}/"

TMUXDIR=${HOME}/.tmux
mkdir -vp "${TMUXDIR}"
cp -vf tmux/* "${TMUXDIR}/"
