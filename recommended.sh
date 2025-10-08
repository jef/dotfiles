#!/bin/sh

# Dotfiles recommended tools installer
# Supports macOS (Homebrew) and Arch Linux (yay/pacman)

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    printf "${BLUE}[INFO]${NC} %s\n" "$1"
}

log_success() {
    printf "${GREEN}[SUCCESS]${NC} %s\n" "$1"
}

log_warning() {
    printf "${YELLOW}[WARNING]${NC} %s\n" "$1"
}

log_error() {
    printf "${RED}[ERROR]${NC} %s\n" "$1"
}

# Detect operating system
detect_os() {
    if [ "$(uname)" = "Darwin" ]; then
        echo "macos"
    elif [ -f /etc/arch-release ]; then
        echo "arch"
    else
        echo "unknown"
    fi
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install tools on macOS using Homebrew
install_macos() {
    log_info "Detected macOS"
    
    # Check if Homebrew is installed
    if ! command_exists brew; then
        log_error "Homebrew is not installed. Please install it first:"
        log_error "Run: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
    
    log_info "Installing recommended tools via Homebrew..."
    
    # List of tools to install
    tools="eza bat neovim fzf ripgrep fd alacritty"
    
    for tool in $tools; do
        if brew list "$tool" >/dev/null 2>&1; then
            log_success "$tool is already installed"
        else
            log_info "Installing $tool..."
            if brew install "$tool"; then
                log_success "$tool installed successfully"
            else
                log_error "Failed to install $tool"
            fi
        fi
    done
}

# Install tools on Arch Linux using yay or pacman
install_arch() {
    log_info "Detected Arch Linux"
    
    # Prefer yay over pacman for AUR support
    if command_exists yay; then
        INSTALLER="yay"
        INSTALL_CMD="yay -S --noconfirm"
        CHECK_CMD="yay -Qi"
    elif command_exists pacman; then
        INSTALLER="pacman"
        INSTALL_CMD="sudo pacman -S --noconfirm"
        CHECK_CMD="pacman -Qi"
    else
        log_error "Neither yay nor pacman found. Please install one of them first."
        exit 1
    fi
    
    log_info "Installing recommended tools via $INSTALLER..."
    
    # List of tools to install (Arch package names)
    tools="eza bat neovim fzf ripgrep fd alacritty"
    
    for tool in $tools; do
        if $CHECK_CMD "$tool" >/dev/null 2>&1; then
            log_success "$tool is already installed"
        else
            log_info "Installing $tool..."
            if $INSTALL_CMD "$tool"; then
                log_success "$tool installed successfully"
            else
                log_error "Failed to install $tool"
            fi
        fi
    done
}

# Main installation function
main() {
    log_info "Starting installation of recommended tools..."
    
    OS=$(detect_os)
    
    case "$OS" in
        "macos")
            install_macos
            ;;
        "arch")
            install_arch
            ;;
        "unknown")
            log_error "Unsupported operating system"
            log_error "This script supports macOS and Arch Linux only"
            exit 1
            ;;
    esac
    
    log_success "Installation completed!"
    log_info "You may need to restart your terminal or source your shell configuration to use the new tools."
}

# Run main function
main "$@"
