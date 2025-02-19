extract() {
    # Only check for missing tools on the first function call
    if [ ! -f ~/.zsh_tools_checked ]; then
        check_tools || return 1
    fi

    if [ -f "$1" ]; then
        echo "📂 Contents of $1:"
        case "$1" in
            *.tar.bz2)   tar tjf "$1" ;;
            *.tar.gz)    tar tzf "$1" ;;
            *.bz2)       echo "$1 is a single compressed file, no preview available." ;;
            *.rar)       unrar l "$1" ;;
            *.gz)        echo "$1 is a single compressed file, no preview available." ;;
            *.tar)       tar tf "$1" ;;
            *.tbz2)      tar tjf "$1" ;;
            *.tgz)       tar tzf "$1" ;;
            *.zip)       unzip -l "$1" ;;
            *.7z)        7z l "$1" ;;
            *.Z)         echo "$1 is a single compressed file, no preview available." ;;
            *)           echo "Unsupported archive format: $1"; return 1 ;;
        esac

        echo ""
        echo -n "Do you want to extract this archive? (y/n): "
        read confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            echo "Extracting $1..."
            case "$1" in
                *.tar.bz2)   tar xjf "$1" ;;
                *.tar.gz)    tar xzf "$1" ;;
                *.bz2)       bunzip2 "$1" ;;
                *.rar)       unrar x "$1" ;;
                *.gz)        gunzip "$1" ;;
                *.tar)       tar xf "$1" ;;
                *.tbz2)      tar xjf "$1" ;;
                *.tgz)       tar xzf "$1" ;;
                *.zip)       unzip "$1" ;;
                *.7z)        7z x "$1" ;;
                *.Z)         uncompress "$1" ;;
                *)           echo "Unsupported archive format: $1"; return 1 ;;
            esac
            echo "✅ Extraction completed: $1"
        else
            echo "❌ Extraction canceled."
        fi
    else
        echo "Usage: extract <archive>"
        echo "Supported formats: tar.bz2, tar.gz, bz2, rar, gz, tar, tbz2, tgz, zip, 7z, Z"
    fi
}
