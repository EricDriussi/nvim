vim.g.mapleader = " "

local function n(lhs, rhs)
  vim.keymap.set("n", lhs, rhs)
end

local function v(lhs, rhs)
  vim.keymap.set("v", lhs, rhs)
end

local function i(lhs, rhs)
  vim.keymap.set("i", lhs, rhs)
end

-- Kinda scrolling
n("<C-d>", "<C-d>zz")
n("<C-u>", "<C-u>zz")

-- Sensible copy-pasting to and from system clipboard
v("<C-y>", "\"+y <bar> <Cmd>echom 'Copied to system clipboard!'<CR>")
n("<C-y>", "\"+yiw <bar> <Cmd>echom 'Copied to system clipboard!'<CR>")
n("<C-p>", "\"+p <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>")
v("<C-p>", "\"+p <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>")
i("<C-p>", "<Esc>\"+p <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>A")

-- Y like you C
n("Y", "y$")

-- Paste over selected text without screwing the reg
v("p", "\"_dP")
v("P", "\"_dP")

-- Select all
n("<C-a>", "ggVG")

-- Esc+Esc to turn off search highlighting
n("<Esc>", "<Cmd>noh<CR>")

-- Center search selection
n("n", "nzzzv")
n("N", "Nzzzv")

-- Search selected text
v("//", "y/\\V<C-R>=escape(@\",'/\')<CR><CR>")

-- Dumb-replace word in Normal mode and selection in Visual mode
n("<silent> rp", "*``cgn")
v("<silent> rp", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>Ncgn")
-- FUCKS UP REG

-- Close tab
n("<C-w>", "<Cmd>q!<CR>")

-- Save all
n("<C-s>", "<Cmd>wa <CR>")

-- Indent
v("<M-h>", "<gv")
v("<M-l>", ">gv")
v("<", "<gv")
v(">", ">gv")
n("<M-h>", "<<")
n("<M-l>", ">>")

-- Move current line
n("<M-j>", "<Cmd>m .+1<CR>==")
n("<M-k>", "<Cmd>m .-2<CR>==")
-- And selected lines
v("<M-j>", "<Cmd>m '>+1<CR>gv=gv")
v("<M-k>", "<Cmd>m '<-2<CR>gv=gv")

-- Split right
n("<C-M-O>", "<Cmd>vsp %<CR>")

-- Resize vertical splits
n("+", "<Cmd>vertical resize +5<CR>")
n("-", "<Cmd>vertical resize -5<CR>")

-- Resize horizontal splits
n("<M-+>", "<Cmd>resize +2<CR>")
n("<M-->", "<Cmd>resize -2<CR>")

-- Navigate splits
n("<C-M-l>", "<Cmd>wincmd l<CR>")
n("<C-M-h>", "<Cmd>wincmd h<CR>")
n("<C-M-j>", "<Cmd>wincmd j<CR>")
n("<C-M-k>", "<Cmd>wincmd k<CR>")

-- Add Undo break points
i(",", ",<C-g>u")
i(".", ".<C-g>u")
i("?", "?<C-g>u")

-- Add number and half page jumps to jumplist
n("<expr> k", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'")
n("<expr> j", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'")
n("<C-u>", "<C-u>m'")
n("<C-d>", "<C-d>m'")

-- Increment number
n("<M-a>", "<C-a>")
