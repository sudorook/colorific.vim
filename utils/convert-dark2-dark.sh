#! /bin/bash
set -eu

FILE="${1}"
NEWFILE="${1%.*}_new.${1##*.}"

# Dark2 -> Dark
sed \
  -e "s/e3e3e3/cfd8dc/g" \
  -e "s/1c1c1c/2e3c44/g" \
  -e "s/545454/607d8b/g" \
  -e "s/e4e4e4/b0b3c5/g" \
  -e "s/2e2e2e/37474f/g" \
  -e "s/d0d0d0/b0bec5/g" \
  -e "s/404040/435761/g" "${FILE}" > "${NEWFILE}"
