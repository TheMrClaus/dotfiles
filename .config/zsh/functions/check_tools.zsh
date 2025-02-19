# Function to check for required tools (only runs once per function call)
check_tools() {
    local tools=("tar" "bunzip2" "unrar" "gunzip" "unzip" "7z" "uncompress" "zip")
    local missing_tools=()

    for tool in "${tools[@]}"; do
        if ! command -v "$tool" &>/dev/null; then
            missing_tools+=("$tool")
        fi
    done

    if [ ${#missing_tools[@]} -ne 0 ]; then
        echo "⚠️ Missing tools: ${missing_tools[*]}"

        # Adjust package names for Arch Linux
        if command -v pacman &>/dev/null; then
            missing_tools=("${missing_tools[@]/7z/p7zip}")   # Replace '7z' with 'p7zip'
            echo "➡ Install with: sudo pacman -S --noconfirm ${missing_tools[*]}"
            if [[ " ${missing_tools[*]} " =~ " rar " ]]; then
                echo "RAR is in the AUR. Install with: yay -S rar"
            fi
        elif command -v apt &>/dev/null; then
            echo "➡ Install with: sudo apt install -y ${missing_tools[*]}"
        elif command -v dnf &>/dev/null; then
            echo "➡ Install with: sudo dnf install -y ${missing_tools[*]}"
        elif command -v brew &>/dev/null; then
            echo "➡ Install with: brew install ${missing_tools[*]}"
        else
            echo "➡ Please install the missing tools manually."
        fi
        return 1  # Exit function early if tools are missing
    fi

    # Mark that the check has been completed by creating a hidden file
    touch ~/.zsh_tools_checked
}
