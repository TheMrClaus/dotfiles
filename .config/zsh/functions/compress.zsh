compress() {
    # Only check for missing tools on the first function call
    if [ ! -f ~/.zsh_tools_checked ]; then
        check_tools || return 1
    fi

    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: compress <archive_name> <file(s)/folder(s)>"
        return 1
    fi

    case "$1" in
        *.tar.bz2)   tar cjf "$1" "${@:2}" ;;
        *.tar.gz)    tar czf "$1" "${@:2}" ;;
        *.bz2)       bzip2 -k "${@:2}" && mv "${@:2}.bz2" "$1" ;;
        *.rar)       rar a "$1" "${@:2}" ;;
        *.gz)        gzip -k "${@:2}" && mv "${@:2}.gz" "$1" ;;
        *.tar)       tar cf "$1" "${@:2}" ;;
        *.tbz2)      tar cjf "$1" "${@:2}" ;;
        *.tgz)       tar czf "$1" "${@:2}" ;;
        *.zip)       zip -r "$1" "${@:2}" ;;
        *.7z)        7z a "$1" "${@:2}" ;;
        *)           echo "Unsupported archive format: $1"; return 1 ;;
    esac

    echo "✅ Archive created: $1"
}
