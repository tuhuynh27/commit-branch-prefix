git() {
    argArr=($@)
    commitMsg=${argArr[3]}
    if [[ $@ == "commit -m "* || $@ == "commit -am "* ]]; then
        sh ~/commit-branch-prefix/script.sh "$commitMsg"
    else
        command git "$@"
    fi
}