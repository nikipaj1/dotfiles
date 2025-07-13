-- Keymaps configuration
-- ~/.config/nvim/lua/config/keymaps.lua

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys (backup method)
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Move to window using <leader> hjkl keys (primary method)
map("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
map("n", "<leader>j", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>k", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Lazy (changed from <leader>l to <leader>L to avoid conflict)
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- Terminal Mappings (updated to use leader)
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<leader>h", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<leader>j", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<leader>k", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<leader>l", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Windows/Panes Management
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- Additional pane management
map("n", "<leader>we", "<C-W>=", { desc = "Equalize window sizes" })
map("n", "<leader>wm", "<C-W>_<C-W>|", { desc = "Maximize current window" })
map("n", "<leader>wo", "<C-W>o", { desc = "Close all other windows" })
map("n", "<leader>wh", "<C-W>H", { desc = "Move window to far left" })
map("n", "<leader>wj", "<C-W>J", { desc = "Move window to bottom" })
map("n", "<leader>wk", "<C-W>K", { desc = "Move window to top" })
map("n", "<leader>wl", "<C-W>L", { desc = "Move window to far right" })
map("n", "<leader>wx", "<C-W>x", { desc = "Swap current window with next" })
map("n", "<leader>wr", "<C-W>r", { desc = "Rotate windows downward" })
map("n", "<leader>wR", "<C-W>R", { desc = "Rotate windows upward" })

-- Quick window resizing
map("n", "<leader>w+", "<cmd>resize +5<cr>", { desc = "Increase window height by 5" })
map("n", "<leader>w_", "<cmd>resize -5<cr>", { desc = "Decrease window height by 5" })
map("n", "<leader>w>", "<cmd>vertical resize +5<cr>", { desc = "Increase window width by 5" })
map("n", "<leader>w<", "<cmd>vertical resize -5<cr>", { desc = "Decrease window width by 5" })

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Additional tab management
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close all other tabs" })
map("n", "<leader><tab>h", "<cmd>-tabmove<cr>", { desc = "Move tab left" })
map("n", "<leader><tab>r", "<cmd>+tabmove<cr>", { desc = "Move tab right" })

-- Diagnostic keymaps
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic in float" })
map("n", "<leader>E", function()
  vim.diagnostic.open_float({ scope = "buffer" })
end, { desc = "Show buffer diagnostics in float" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Set diagnostic loclist" })
map("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "Set diagnostic quickfix" })

-- Enhanced diagnostic display with copy functionality
map("n", "<leader>dc", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if #diagnostics > 0 then
    local diagnostic = diagnostics[1]
    local message = diagnostic.message
    vim.fn.setreg('+', message)
    vim.fn.setreg('"', message)
    vim.notify('Diagnostic copied to clipboard: ' .. message:sub(1, 50) .. (message:len() > 50 and '...' or ''), vim.log.levels.INFO)
  else
    vim.notify('No diagnostic found at cursor', vim.log.levels.WARN)
  end
end, { desc = "Copy diagnostic message" })

-- Enhanced error float with larger window and copy instruction
map("n", "<leader>ef", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if #diagnostics > 0 then
    local diagnostic = diagnostics[1]
    local message = diagnostic.message
    local severity = vim.diagnostic.severity[diagnostic.severity]
    
    -- Create a custom floating window with better formatting
    local lines = {}
    table.insert(lines, string.format("[%s] %s", severity, diagnostic.source or "LSP"))
    table.insert(lines, "")
    
    -- Split long messages into multiple lines
    local max_width = 80
    local words = {}
    for word in message:gmatch("%S+") do
      table.insert(words, word)
    end
    
    local current_line = ""
    for _, word in ipairs(words) do
      if #current_line + #word + 1 <= max_width then
        current_line = current_line .. (current_line ~= "" and " " or "") .. word
      else
        if current_line ~= "" then
          table.insert(lines, current_line)
        end
        current_line = word
      end
    end
    if current_line ~= "" then
      table.insert(lines, current_line)
    end
    
    table.insert(lines, "")
    table.insert(lines, "Press 'y' to copy this message to clipboard")
    
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    
    local width = math.min(max_width, vim.o.columns - 4)
    local height = math.min(#lines, math.floor(vim.o.lines * 0.8))
    
    local win = vim.api.nvim_open_win(buf, true, {
      relative = 'editor',
      width = width,
      height = height,
      col = math.floor((vim.o.columns - width) / 2),
      row = math.floor((vim.o.lines - height) / 2),
      style = 'minimal',
      border = 'rounded',
      title = ' Diagnostic Error ',
      title_pos = 'center',
    })
    
    vim.api.nvim_win_set_option(win, 'wrap', true)
    vim.api.nvim_win_set_option(win, 'linebreak', true)
    
    -- Set up keybindings for the floating window
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = buf, silent = true })
    vim.keymap.set('n', '<Esc>', '<cmd>close<cr>', { buffer = buf, silent = true })
    vim.keymap.set('n', 'y', function()
      vim.fn.setreg('+', message)
      vim.fn.setreg('"', message)
      vim.notify('Diagnostic copied to clipboard!', vim.log.levels.INFO)
      vim.cmd('close')
    end, { buffer = buf, silent = true })
    
    -- Set syntax highlighting
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
  else
    vim.notify('No diagnostic found at cursor', vim.log.levels.WARN)
  end
end, { desc = "Enhanced diagnostic float with copy" }) 
