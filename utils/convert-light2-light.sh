#! /bin/bash
set -eu

file="${1}"
newfile="${1}.new"

cp "$file" "$newfile"

# Light2 -> Light
sed -i "s/949494/78909c/g" "${newfile}"
sed -i "s/d9d9d9/bac5cc/g" "${newfile}"
sed -i "s/2e2e2e/37474f/g" "${newfile}"
sed -i "s/e3e3e3/cfd8dc/g" "${newfile}"
sed -i "s/ededed/e3e8eb/g" "${newfile}"
sed -i "s/f0f0f0/eceff1/g" "${newfile}"
sed -i "s/545454/607d8b/g" "${newfile}"
