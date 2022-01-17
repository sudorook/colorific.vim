#! /bin/bash
set -eu

PALETTE1=(
  eceff1
  cfd8dc # fold and 1st layer
  b0bec5
  90a4ae
  78909c # Comment color
  607d8b
  546e7a
  37474f # dark fold and 1st layer
  263238
  e3e8eb # 2nd layer
  b0b3c5
  c0cbd0
  2e3c44 # dark 2nd layer
  6e8895 # vsplit separator
)

PALETTE2=(
  f0f0f0
  e3e3e3
  d0d0d0
  bdbdbd
  949494
  545454
  474747
  2e2e2e
  212121
  ededed
  c6c6c6
  e4e4e4
  1c1c1c
  5c5c5c
)

PALETTE3=(
  f5f6f7
  e7e8eb
  d3dae3
  bac3cf
  959ba6
  434757
  353945
  3f4251
  383c4a
  e7e8eb
  c4d6e1
  e2e3e6
  2f343f
  474b5b
)

#
# Functions
#

function set_palette {
  local res
  case "${1}" in
    palette1|Palette1|PALETTE1|1)
      res=PALETTE1
      ;;
    palette2|Palette2|PALETTE2|2)
      res=PALETTE2
      ;;
    *)
      exit 3
  esac
  echo "${res}"
}

function convert_palette {
  local i
  local cmd="sed "
  for i in "${!PALETTE1[@]}"; do
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
