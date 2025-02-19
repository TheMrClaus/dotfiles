bigfiles() {
    find "${1:-.}" -type f -exec du -h {} + | sort -rh | head -10
}
