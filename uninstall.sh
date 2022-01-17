#! /bin/bash
set -eu

rm_items() {
  local item
  for item in "${@}"; do
    if [ -f "${item}" ]; then
      rm -v "${item}"
    fi
    if [ -d "${item}" ]; then
      rmdir --ignore-fail-on-non-empty -p "${item}"
    fi
  done
}

VIMDIR=${HOME}/.vim
GITDIR=${HOME}/.config/git
TMUXDIR=${HOME}/.tmux

rm_items \
  "${VIMDIR}"/colors/colorific.vim \
  "${VIMDIR}"/colors \
  "${VIMDIR}"/autoload/airline/themes/colorific.vim \
  "${VIMDIR}"/autoload/airline/themes \
  "${GITDIR}"/gitk-{light,light2,light3,dark,dark2,dark3} \
  "${GITDIR}" \
  "${TMUXDIR}"/{light,light2,light3,dark,dark2,dark3}.tmuxtheme \
  "${TMUXDIR}"
