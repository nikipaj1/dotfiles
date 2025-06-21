#!/bin/bash
# LunarVim Setup Script for Dotfiles
# This script will install LunarVim and set up the configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_dependencies() {
    print_status "Checking dependencies..."
    
    # Check for Neovim
    if ! command -v nvim &> /dev/null; then
        print_error "Neovim is not installed. Please install it first."
        exit 1
    fi
    
    # Check Neovim version
    nvim_version=$(nvim --version | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
    if [[ "$(printf '%s\n' "$nvim_version" "0.9.0" | sort -V | head -n1)" != "0.9.0" ]]; then
        print_error "Neovim version $nvim_version is too old. Please install version 0.9.0 or newer."
        exit 1
    fi
    
    print_success "Neovim $nvim_version is installed and compatible"
    
    # Check for curl
    if ! command -v curl &> /dev/null; then
        print_error "curl is not installed. Please install it first."
        exit 1
    fi
    
    # Check for git
    if ! command -v git &> /dev/null; then
        print_error "git is not installed. Please install it first."
        exit 1
    fi
}

install_lunarvim() {
    print_status "Installing LunarVim..."
    
    # Check if LunarVim is already installed (check both PATH and common locations)
    if command -v lvim &> /dev/null || [ -f "$HOME/.local/bin/lvim" ]; then
        print_warning "LunarVim is already installed. Skipping installation."
        return 0
    fi
    
    # Install LunarVim
    LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
    
    # Check if installation was successful (check both PATH and common locations)
    if command -v lvim &> /dev/null || [ -f "$HOME/.local/bin/lvim" ]; then
        print_success "LunarVim installed successfully"
        
        # Add to PATH if not already there
        if ! command -v lvim &> /dev/null && [ -f "$HOME/.local/bin/lvim" ]; then
            print_status "Adding LunarVim to PATH..."
            
            # Add to zshenv for permanent PATH addition
            if ! grep -q "/Users/$(whoami)/.local/bin" ~/.zshenv 2>/dev/null; then
                echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshenv
                print_success "Added ~/.local/bin to PATH in ~/.zshenv"
            fi
            
            # Update current session PATH
            export PATH="$HOME/.local/bin:$PATH"
            print_success "LunarVim is now available in PATH"
        fi
    else
        print_error "LunarVim installation failed"
        exit 1
    fi
}

backup_existing_config() {
    if [ -d "$HOME/.config/lvim" ]; then
        print_status "Backing up existing LunarVim configuration..."
        mv "$HOME/.config/lvim" "$HOME/.config/lvim.backup.$(date +%Y%m%d_%H%M%S)"
        print_success "Existing configuration backed up"
    fi
}

setup_configuration() {
    print_status "Setting up LunarVim configuration..."
    
    # Create .config directory if it doesn't exist
    mkdir -p "$HOME/.config"
    
    # Create symbolic link
    ln -sf "$DOTFILES_DIR/config/lvim" "$HOME/.config/lvim"
    
    print_success "Configuration linked successfully"
}

install_optional_dependencies() {
    print_status "Installing optional dependencies..."
    
    # Check if we're on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Check if Homebrew is installed
        if command -v brew &> /dev/null; then
            print_status "Installing dependencies via Homebrew..."
            
            # Install ripgrep if not present
            if ! command -v rg &> /dev/null; then
                brew install ripgrep
                print_success "ripgrep installed"
            fi
            
            # Install Node.js if not present
            if ! command -v node &> /dev/null; then
                brew install node
                print_success "Node.js installed"
            fi
            
            # Install Go if not present
            if ! command -v go &> /dev/null; then
                brew install go
                print_success "Go installed"
            fi
        else
            print_warning "Homebrew not found. Please install optional dependencies manually:"
            echo "  - ripgrep (for better searching)"
            echo "  - Node.js (for TypeScript/React support)"
            echo "  - Go (for Go development)"
        fi
    else
        print_warning "Not on macOS. Please install optional dependencies manually:"
        echo "  - ripgrep (for better searching)"
        echo "  - Node.js (for TypeScript/React support)"
        echo "  - Go (for Go development)"
    fi
    
    # Install npm packages if Node.js is available
    if command -v npm &> /dev/null; then
        print_status "Installing global npm packages..."
        npm install -g prettier eslint
        print_success "npm packages installed"
    fi
    
    # Install Go tools if Go is available
    if command -v go &> /dev/null; then
        print_status "Installing Go tools..."
        go install golang.org/x/tools/gopls@latest
        go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
        print_success "Go tools installed"
    fi
}

main() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}    LunarVim Dotfiles Setup Script     ${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo
    
    check_dependencies
    install_lunarvim
    backup_existing_config
    setup_configuration
    install_optional_dependencies
    
    echo
    print_success "LunarVim setup complete!"
    echo
    echo "Next steps:"
    echo "1. Run 'lvim' to start LunarVim"
    echo "2. Wait for plugins to install automatically"
    echo "3. Check the README in config/lvim/ for key mappings"
    echo
    echo "Enjoy your new LunarVim setup! 🚀"
}

# Run the main function
main "$@" 