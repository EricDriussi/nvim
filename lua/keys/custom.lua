local function vmap(lhs, rhs)
  Map("v", lhs, rhs)
end
local function imap(lhs, rhs)
  Map("i", lhs, rhs)
end

return function()
  Nmap("L", "$")
  Nmap("H", "^")
  vmap("L", "$")
  vmap("H", "^")

  -- Center half-page jumps and add them to jumplist
  Nmap("<C-d>", "<C-d>zzm'")
  Nmap("<C-u>", "<C-u>zzm'")

  -- Sensible copy-pasting to and from system clipboard
  vmap("<C-y>", "\"+ygv<ESC> <bar> <cmd>echom 'Yanked to system!'<cr>")
  Nmap("<C-y>", "\"+yiw <bar> <cmd>echom 'Yanked to system!'<cr>")
  Nmap("<C-p>", "\"+p <bar> <cmd>echom 'Pasted from system!'<cr>")
  vmap("<C-p>", "\"+p <bar> <cmd>echom 'Pasted from system!'<cr>")
  imap("<C-p>", "<Esc>\"+p <bar> <cmd>echom 'Pasted from system!'<cr>A")

  -- Y like you C
  Nmap("Y", "y$")

  -- Prevent cursor from jumping back
  vmap("y", "ygv<ESC>")

  -- Paste over selected text without screwing the reg
  vmap("p", '"_dP')
  vmap("P", '"_dP')

  -- Select all
  Nmap("<C-a>", "ggVG")

  -- Clear search with <esc>
  Map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

  -- Center search selection
  Nmap("n", "nzzzv")
  Nmap("N", "Nzzzv")

  -- Search selected text
  vmap("//", "y/\\V<C-R>=escape(@\",'/')<cr><cr>")

  -- Dumb-replace word
  Nmap("rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

  -- Close
  Nmap("<C-w>", "<cmd>q!<cr>")

  -- Save all
  Map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>silent wa<cr><esc>", { desc = "Save Files" })

  -- Move Lines
  Nmap("<M-h>", "<<")
  Nmap("<M-l>", ">>")
  vmap("<M-h>", "<gv")
  vmap("<M-l>", ">gv")

  -- Resize vertical splits
  Nmap("+", "<cmd>vertical resize +5<cr>")
  Nmap("-", "<cmd>vertical resize -5<cr>")

  -- Resize horizontal splits
  Nmap("<M-+>", "<cmd>resize +2<cr>")
  Nmap("<M-->", "<cmd>resize -2<cr>")

  -- Navigate splits
  Nmap("<C-M-l>", "<cmd>wincmd l<cr>")
  Nmap("<C-M-h>", "<cmd>wincmd h<cr>")
  Nmap("<C-M-j>", "<cmd>wincmd j<cr>")
  Nmap("<C-M-k>", "<cmd>wincmd k<cr>")

  -- Add number jumps to jumplist
  Nmap("<expr> k", '(v:count > 5 ? "m\'" . v:count : "") . \'k\'')
  Nmap("<expr> j", '(v:count > 5 ? "m\'" . v:count : "") . \'j\'')

  -- Increment/Decrement number
  Nmap("<M-a>", "<C-a>")
  Nmap("<M-x>", "<C-x>")

  -- Only yank deleted lines if not empty
  Nmap("dd", function()
    if vim.api.nvim_get_current_line():match("^%s*$") then
      return '"_dd'
    end
    return "dd"
  end, { expr = true })

  -- diagnostics
  Nmap("ge", function()
    vim.diagnostic.open_float({ scope = "line" })
  end, { desc = "Diagnostics" })
  Nmap("gn", function()
    vim.diagnostic.goto_next()
  end, { desc = "Diagnostics" })
  Nmap("gp", function()
    vim.diagnostic.goto_prev()
  end, { desc = "Diagnostics" })
end
