#!/bin/bash
msg="$*"
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
IFS='/' read -ra ticket <<< "$branch"
prefix=${ticket[1]}
if [[ "${prefix}" = "" || $branch != *"/"*"/"* ]]; then
  prefix=""
else
  prefix="${prefix:0:10} "
fi
commitMsg="${prefix}$msg"
git commit -m "$commitMsg" || exit 1
echo "Done by https://github.com/huynhminhtufu/commit-branch-prefix"
exit 0
