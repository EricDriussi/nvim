vim.g.mapleader = " "

local function n(lhs, rhs, opts)
	vim.keymap.set("n", lhs, rhs, opts or {})
end
local function v(lhs, rhs)
	vim.keymap.set("v", lhs, rhs)
end
local function i(lhs, rhs)
	vim.keymap.set("i", lhs, rhs)
end

n("L", "$")
n("H", "^")
v("L", "$")
v("H", "^")

-- Center half-page jumps and add them to jumplist
n("<C-d>", "<C-d>zzm'")
n("<C-u>", "<C-u>zzm'")

-- Sensible copy-pasting to and from system clipboard
v("<C-y>", "\"+ygv<ESC> <bar> <Cmd>echom 'Copied to system clipboard!'<CR>")
n("<C-y>", "\"+yiw <bar> <Cmd>echom 'Copied to system clipboard!'<CR>")
n("<C-p>", "\"+p <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>")
v("<C-p>", "\"+p <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>")
i("<C-p>", "<Esc>\"+p <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>A")

-- Y like you C
n("Y", "y$")

-- Prevent cursor from jumping back
v("y", "ygv<ESC>")

-- Paste over selected text without screwing the reg
v("p", '"_dP')
v("P", '"_dP')

-- Select all
n("<C-a>", "ggVG")

-- Esc+Esc to turn off search highlighting and error messages
n("<Esc>", "<Cmd>noh<bar>echo<CR>")

-- Center search selection
n("n", "nzzzv")
n("N", "Nzzzv")

-- Search selected text
v("//", "y/\\V<C-R>=escape(@\",'/')<CR><CR>")

-- Dumb-replace word
n("rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Close tab
n("<C-w>", "<Cmd>q!<CR>")

-- Save all
n("<C-s>", "<Cmd>silent wa<CR>")

-- Move lines
-- Left & Right
n("<M-h>", "<<")
n("<M-l>", ">>")
v("<M-h>", "<gv")
v("<M-l>", ">gv")
-- Up & Down
n("<M-j>", "<Cmd>m .+1<CR>==")
n("<M-k>", "<Cmd>m .-2<CR>==")
v("<M-j>", "<Cmd>m '>+1<CR>gv=gv")
v("<M-k>", "<Cmd>m '<-2<CR>gv=gv")

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

-- Add number jumps to jumplist
n("<expr> k", '(v:count > 5 ? "m\'" . v:count : "") . \'k\'')
n("<expr> j", '(v:count > 5 ? "m\'" . v:count : "") . \'j\'')

-- Increment number
n("<M-a>", "<C-a>")

-- Only yank deleted lines if not empty
local function fancy_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end
n("dd", fancy_dd())

-- Fancy text objects
-- https://thevaluable.dev/vim-create-text-objects/
local chars = { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?", "!" }
for _, char in ipairs(chars) do
	for _, mode in ipairs({ "x", "o" }) do
		vim.keymap.set(
			mode,
			"i" .. char,
			string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char),
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			mode,
			"a" .. char,
			string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char),
			{ noremap = true, silent = true }
		)
	end
end
