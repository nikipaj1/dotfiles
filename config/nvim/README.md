# Neovim Configuration

This is a modern Neovim configuration that replaces LunarVim with a custom setup using lazy.nvim as the plugin manager.

## Features

- **Language Support**: Full support for Go, TypeScript, JavaScript, React, and more
- **LSP Integration**: Complete Language Server Protocol setup with jump-to-definition, references, and more
- **Telescope**: Powerful fuzzy finder for files, grep, and LSP functions
- **Modern UI**: Beautiful interface with Dracula theme, statusline, and file explorer
- **Git Integration**: Built-in git signs, blame, and diff functionality
- **Auto-completion**: Intelligent code completion with snippets
- **Formatting & Linting**: Automatic code formatting and linting on save

## Key Bindings

### Leader Key

- Leader key is set to `<Space>`

### File Navigation (Telescope)

- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files
- `<leader>fc` - Commands
- `<leader>fs` - Grep string under cursor

### LSP Navigation

- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `gt` - Go to type definition
- `K` - Show hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

### Buffer Management

- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer
- `<leader>bd` - Delete buffer
- `<leader>bb` - Switch to other buffer

### File Explorer

- `<C-e>` - Toggle NERDTree
- `<leader>e` - Toggle Neo-tree (alternative)
- `<leader>E` - Reveal current file in explorer
- `<leader>nf` - Find current file in NERDTree

### Pane/Window Management

#### Basic Navigation

- `<leader>h` - Move to left window (primary)
- `<leader>j` - Move to lower window (primary)
- `<leader>k` - Move to upper window (primary)
- `<leader>l` - Move to right window (primary)
- `<C-h>` - Move to left window (backup)
- `<C-j>` - Move to lower window (backup)
- `<C-k>` - Move to upper window (backup)
- `<C-l>` - Move to right window (backup)

#### Window Creation & Deletion

- `<leader>w-` or `<leader>-` - Split window horizontally (below)
- `<leader>w|` or `<leader>|` - Split window vertically (right)
- `<leader>wd` - Delete/close current window
- `<leader>wo` - Close all other windows (keep only current)
- `<leader>ww` - Switch to other/previous window

#### Window Resizing

- `<C-Up>` - Increase window height by 2
- `<C-Down>` - Decrease window height by 2
- `<C-Left>` - Decrease window width by 2
- `<C-Right>` - Increase window width by 2
- `<leader>w+` - Increase window height by 5
- `<leader>w_` - Decrease window height by 5
- `<leader>w>` - Increase window width by 5
- `<leader>w<` - Decrease window width by 5
- `<leader>we` - Equalize all window sizes

#### Window Movement & Layout

- `<leader>wh` - Move current window to far left
- `<leader>wj` - Move current window to bottom
- `<leader>wk` - Move current window to top
- `<leader>wl` - Move current window to far right
- `<leader>wx` - Swap current window with next
- `<leader>wr` - Rotate windows downward
- `<leader>wR` - Rotate windows upward
- `<leader>wm` - Maximize current window

### Tab Management

- `<leader><tab><tab>` - Create new tab
- `<leader><tab>d` - Close current tab
- `<leader><tab>o` - Close all other tabs
- `<leader><tab>]` - Next tab
- `<leader><tab>[` - Previous tab
- `<leader><tab>f` - First tab
- `<leader><tab>l` - Last tab
- `<leader><tab>h` - Move tab left
- `<leader><tab>l` - Move tab right

### Git

- `]h` / `[h` - Next/previous git hunk
- `<leader>ghs` - Stage hunk
- `<leader>ghr` - Reset hunk
- `<leader>ghp` - Preview hunk
- `<leader>ghb` - Blame line

### Go-specific

- `<leader>gsj` - Add JSON struct tags
- `<leader>gsy` - Add YAML struct tags
- `<leader>gte` - Test function
- `<leader>gtf` - Test file
- `<leader>gr` - Go run
- `<leader>gb` - Go build

### TypeScript-specific

- `<leader>co` - Organize imports
- `<leader>cR` - Rename file
- `<leader>tc` - Type check
- `<leader>tw` - Type check watch

### Terminal

- `<C-\>` - Toggle floating terminal
- `<leader>tf` - Float terminal
- `<leader>th` - Horizontal terminal
- `<leader>tv` - Vertical terminal

## Pane Management Workflows

### Common Workflows

1. **Split and Navigate**:

   ```
   <leader>|        # Split vertically
   <leader>l        # Move to new pane
   <leader>ff       # Find file in new pane
   ```

2. **Resize for Code Review**:

   ```
   <leader>|        # Split vertically
   <leader>w>       # Make right pane wider
   <leader>w>       # Make it even wider
   ```

3. **Three-pane Development**:

   ```
   <leader>|        # Split vertically
   <leader>-        # Split horizontally in right pane
   <leader>we       # Equalize all panes
   ```

4. **Quick File Comparison**:

   ```
   <leader>|        # Split vertically
   <leader>l        # Move to right pane
   <leader>ff       # Open different file
   <leader>h        # Back to left pane
   ```

5. **Terminal + Editor**:
   ```
   <leader>-        # Split horizontally
   <leader>j        # Move to bottom pane
   <leader>tf       # Open terminal
   <leader>k        # Back to editor
   ```

### Advanced Layouts

- **IDE-like Layout**: File explorer (left) + main editor (center) + terminal (bottom)
- **Comparison Layout**: Two files side by side with equal width
- **Review Layout**: Main file (large) + reference files (smaller panes)

## Installation

1. **Backup your existing Neovim configuration** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Create symlink to this configuration**:

   ```bash
   ln -s /path/to/your/dotfiles/config/nvim ~/.config/nvim
   ```

3. **Start Neovim**:

   ```bash
   nvim
   ```

4. **Install plugins**: The configuration will automatically install lazy.nvim and all plugins on first run.

5. **Install language servers**: Run `:Mason` to install additional language servers and tools.

## Language Servers Included

- **TypeScript/JavaScript**: `tsserver`, `eslint`
- **Go**: `gopls`
- **JSON**: `jsonls`
- **YAML**: `yamlls`
- **HTML**: `html`
- **CSS**: `cssls`
- **Lua**: `lua_ls`

## Formatters & Linters

- **Prettier**: JavaScript, TypeScript, JSON, YAML, HTML, CSS
- **ESLint**: JavaScript, TypeScript
- **Go**: `goimports`, `gofmt`, `golangci-lint`
- **Stylua**: Lua formatting

## File Structure

```
config/nvim/
├── init.lua                 # Main configuration entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Autocommands
│   │   ├── keymaps.lua      # Key mappings
│   │   └── options.lua      # Neovim options
│   └── plugins/
│       ├── colorscheme.lua  # Dracula theme
│       ├── completion.lua   # nvim-cmp configuration
│       ├── editor.lua       # Editor utilities
│       ├── go.lua          # Go language support
│       ├── lsp.lua         # LSP configuration
│       ├── telescope.lua   # Telescope configuration
│       ├── treesitter.lua  # Treesitter configuration
│       ├── typescript.lua  # TypeScript/React support
│       └── ui.lua          # UI plugins
└── README.md
```

## Customization

To customize this configuration:

1. **Add new plugins**: Create new files in `lua/plugins/` or modify existing ones
2. **Change keymaps**: Edit `lua/config/keymaps.lua`
3. **Modify options**: Edit `lua/config/options.lua`
4. **Add autocommands**: Edit `lua/config/autocmds.lua`

## Troubleshooting

- **Plugins not loading**: Run `:Lazy sync` to update plugins
- **LSP not working**: Run `:Mason` and install required language servers
- **Formatting issues**: Check `:ConformInfo` for formatter status
- **Linting issues**: Check `:LspInfo` for linter configuration

## Migration from LunarVim

This configuration provides similar functionality to LunarVim but with:

- Cleaner, more maintainable code structure
- Better performance with lazy loading
- More explicit configuration
- Easier customization
- Modern plugin ecosystem

Most keybindings remain the same for a smooth transition.
