#! /bin/bash
set -eu

#
# Define color palettes
#

DARK=(  cfd8dc 2e3c44 607d8b b0b3c5 37474f b0bec5 435761)
DARK2=( e3e3e3 1c1c1c 545454 e4e4e4 2e2e2e d0d0d0 404040)
DARK3=( d3dae3 2f343f 353945 d3dae3 3f4251 d3dae3 434757)
LIGHT=( 78909c bac5cc 37474f cfd8dc e3e8eb eceff1 607d8b)
LIGHT2=(949494 d9d9d9 2e2e2e e3e3e3 ededed f0f0f0 545454)
LIGHT3=(959ba6 dddee1 5c616c e7e8eb f5f6f7 ffffff 353945)


#
# Functions
#

function set_palette {
  local res
  case "${1}" in
    light|LIGHT|Light)
      res=LIGHT
      ;;
    light2|LIGHT2|Light2)
      res=LIGHT2
      ;;
    dark|DARK|Dark)
      res=DARK
      ;;
    dark2|DARK2|Dark2)
      res=DARK2
      ;;
    *)
      exit 3
  esac
  echo "${res}"
}

function convert_palette {
  local i
  local cmd="sed "
  for i in "${!DARK[@]}"; do
    cmd="${cmd} -e \"s/\${${FROM}[${i}]}/\${${TO}[${i}]}/g\""
  done
  cmd="${cmd} ${INPUT@Q} > ${OUTPUT@Q}"
  echo "${cmd}" <&2
  eval "${cmd}"
}


#
# Main
#

OPTIONS=f:t:i:
LONGOPTIONS=from:,to:,input:
PARSED=$(getopt -o ${OPTIONS} --long ${LONGOPTIONS} -n "$0" -- "$@")
eval set -- "$PARSED"

while [ $# -ge 1 ]; do
  case "$1" in
    -i|--input)
      INPUT="${2}"
      OUTPUT="${2%%.*}_new.${2##*.}"
      shift 2
      ;;
    -f|--from)
      FROM="$(set_palette "${2}")"
      shift 2
      ;;
    -t|--to)
      TO="$(set_palette "${2}")"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    *)
      exit 3
      ;;
  esac
done

if ! [[ -v INPUT ]]; then
  echo "ERROR: 'input' field '-i' unspecified. Exiting." >&2
fi

if ! [[ -v FROM ]]; then
  echo "ERROR: 'from' field '-f' unspecified. Exiting." >&2
fi

if ! [[ -v TO ]]; then
  echo "ERROR: 'to' field '-t' unspecified. Exiting." >&2
fi

convert_palette
