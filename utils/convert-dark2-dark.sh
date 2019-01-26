#! /bin/bash
set -eu

file="${1}"
newfile="${1}.new"

cp "$file" "$newfile"

# Dark2 -> Dark
sed -i "s/e3e3e3/cfd8dc/g" "${newfile}"
sed -i "s/1c1c1c/2e3c44/g" "${newfile}"
sed -i "s/545454/607d8b/g" "${newfile}"
sed -i "s/e4e4e4/b0b3c5/g" "${newfile}"
sed -i "s/2e2e2e/37474f/g" "${newfile}"
sed -i "s/d0d0d0/b0bec5/g" "${newfile}"
sed -i "s/404040/435761/g" "${newfile}"
# sed -i "s/404040/465B66/g" "${newfile}"
