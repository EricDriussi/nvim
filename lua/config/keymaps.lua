local map = vim.keymap.set

-- copy from LazyVim

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- formatting
map({ "n", "v" }, "<leader>l", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })
LazyVim.toggle.map("<leader>L", LazyVim.toggle.format())

-- toggle relativenumber
LazyVim.toggle.map("<leader>R", LazyVim.toggle("relativenumber", { name = "Relative Number" }))

-- lazygit
map("n", "<leader>gg", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit" })
map("n", "<leader>gf", function()
  local git_path = vim.api.nvim_buf_get_name(0)
  LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } })
end, { desc = "Lazygit Current File History" })
map("n", "<leader>gl", function()
  LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Log" })
map("n", "<leader>gL", function()
  LazyVim.lazygit({ args = { "log" } })
end, { desc = "Lazygit Log (cwd)" })

-- TODO: review buffers
-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
-- map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- TODO: review tabs
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Mine

local function n(lhs, rhs, opts)
  map("n", lhs, rhs, opts or {})
end
local function v(lhs, rhs)
  map("v", lhs, rhs)
end
local function i(lhs, rhs)
  map("i", lhs, rhs)
end

map({ "n", "v" }, "<leader>l", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

n("L", "$")
n("H", "^")
v("L", "$")
v("H", "^")

-- Center half-page jumps and add them to jumplist
n("<C-d>", "<C-d>zzm'")
n("<C-u>", "<C-u>zzm'")

-- Sensible copy-pasting to and from system clipboard
v("<C-y>", "\"+ygv<ESC> <bar> <cmd>echom 'Yanked to system!'<cr>")
n("<C-y>", "\"+yiw <bar> <cmd>echom 'Yanked to system!'<cr>")
n("<C-p>", "\"+p <bar> <cmd>echom 'Pasted from system!'<cr>")
v("<C-p>", "\"+p <bar> <cmd>echom 'Pasted from system!'<cr>")
i("<C-p>", "<Esc>\"+p <bar> <cmd>echom 'Pasted from system!'<cr>A")

-- Y like you C
n("Y", "y$")

-- Prevent cursor from jumping back
v("y", "ygv<ESC>")

-- Paste over selected text without screwing the reg
v("p", '"_dP')
v("P", '"_dP')

-- Select all
n("<C-a>", "ggVG")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Center search selection
n("n", "nzzzv")
n("N", "Nzzzv")

-- Search selected text
v("//", "y/\\V<C-R>=escape(@\",'/')<cr><cr>")

-- Dumb-replace word
n("rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Close
n("<C-w>", "<cmd>q!<cr>")

-- Save all
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>silent wa<cr><esc>", { desc = "Save Files" })

-- Resize vertical splits
n("+", "<cmd>vertical resize +5<cr>")
n("-", "<cmd>vertical resize -5<cr>")

-- Resize horizontal splits
n("<M-+>", "<cmd>resize +2<cr>")
n("<M-->", "<cmd>resize -2<cr>")

-- Navigate splits
n("<C-M-l>", "<cmd>wincmd l<cr>")
n("<C-M-h>", "<cmd>wincmd h<cr>")
n("<C-M-j>", "<cmd>wincmd j<cr>")
n("<C-M-k>", "<cmd>wincmd k<cr>")

-- Add number jumps to jumplist
n("<expr> k", '(v:count > 5 ? "m\'" . v:count : "") . \'k\'')
n("<expr> j", '(v:count > 5 ? "m\'" . v:count : "") . \'j\'')

-- Increment/Decrement number
n("<M-a>", "<C-a>")
n("<M-x>", "<C-x>")

-- Only yank deleted lines if not empty
n("dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  end
  return "dd"
end, { expr = true })

-- TODO: this might not be needed with mini.ai
-- Fancy text objects
-- https://thevaluable.dev/vim-create-text-objects/
-- local chars = { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?", "!" }
-- for _, char in ipairs(chars) do
--   for _, mode in ipairs({ "x", "o" }) do
--     map(
--       mode,
--       "i" .. char,
--       string.format(":<C-u>silent! normal! f%sF%slvt%s<cr>", char, char, char),
--       { noremap = true, silent = true }
--     )
--     map(
--       mode,
--       "a" .. char,
--       string.format(":<C-u>silent! normal! f%sF%svf%s<cr>", char, char, char),
--       { noremap = true, silent = true }
--     )
--   end
-- end

-- diagnostics

n("gld", function()
  vim.diagnostic.open_float({ scope = "line" })
end)
n("gnd", function()
  vim.diagnostic.goto_next()
end)
n("gpd", function()
  vim.diagnostic.goto_prev()
end)
n("gne", function()
  vim.diagnostic.goto_next({ severity = "ERROR" })
end)
n("gpe", function()
  vim.diagnostic.goto_prev({ severity = "ERROR" })
end)
