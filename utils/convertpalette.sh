#! /bin/bash
set -eu

infile="${1}"
outfile="new_${1}"

cp "${infile}" "${outfile}"

sed -i "s/colorific/colorific2/g" "${outfile}"

# Manual
sed -i "s/#eceff1/#f0f0f0/g" "${outfile}"
sed -i "s/#cfd8dc/#e3e3e3/g" "${outfile}" # fold and 1st layer
sed -i "s/#b0bec5/#d0d0d0/g" "${outfile}"
sed -i "s/#90a4ae/#bdbdbd/g" "${outfile}"
sed -i "s/#78909c/#949494/g" "${outfile}" # Comment color
sed -i "s/#607d8b/#545454/g" "${outfile}"
sed -i "s/#546e7a/#474747/g" "${outfile}"
sed -i "s/#37474f/#2e2e2e/g" "${outfile}" # dark fold and 1st layer
sed -i "s/#263238/#212121/g" "${outfile}"

sed -i "s/#e3e8eb/#ededed/g" "${outfile}" # 2nd layer
sed -i "s/#b0b3c5/#c6c6c6/g" "${outfile}"
sed -i "s/#c0cbd0/#e4e4e4/g" "${outfile}"
sed -i "s/#2e3c44/#1c1c1c/g" "${outfile}" # dark 2nd layer
sed -i "s/#6e8895/#5c5c5c/g" "${outfile}" # vsplit separator
