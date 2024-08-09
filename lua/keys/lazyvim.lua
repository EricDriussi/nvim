return function()
  -- Better up/down
  Map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
  Map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
  Map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
  Map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

  -- Move Lines
  Map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
  Map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
  Map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
  Map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
  Map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
  Map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

  -- Add undo break-points
  Map("i", ",", ",<c-g>u")
  Map("i", ".", ".<c-g>u")
  Map("i", ";", ";<c-g>u")

  -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
  Map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
  Map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
  Map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
  Map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
  Map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
  Map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

  -- Formatting
  Map({ "n", "v" }, "<leader>l", function()
    LazyVim.format({ force = true })
  end, { desc = "Format" })
  LazyVim.toggle.map("<leader>L", LazyVim.toggle.format())

  -- Toggle relativenumber
  LazyVim.toggle.map("<leader>n", LazyVim.toggle("relativenumber", { name = "Relative Number" }))

  -- Lazygit
  Map("n", "<leader>gg", function()
    LazyVim.lazygit({ cwd = LazyVim.root.git() })
  end, { desc = "Lazygit" })
  Map("n", "<leader>gf", function()
    local git_path = vim.api.nvim_buf_get_name(0)
    LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } })
  end, { desc = "File History" })
  Map("n", "<leader>gl", function()
    LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
  end, { desc = "Log" })
end
