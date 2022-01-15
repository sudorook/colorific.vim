#! /bin/bash
set -eu

FILE="${1}"
NEWFILE="${1%.*}_new.${1##*.}"

# Light2 -> Light
sed \
  -e "s/949494/78909c/g" \
  -e "s/d9d9d9/bac5cc/g" \
  -e "s/2e2e2e/37474f/g" \
  -e "s/e3e3e3/cfd8dc/g" \
  -e "s/ededed/e3e8eb/g" \
  -e "s/f0f0f0/eceff1/g" \
  -e "s/545454/607d8b/g" "${FILE}" > "${NEWFILE}"
