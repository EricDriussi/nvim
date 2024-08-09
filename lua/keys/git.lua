return function(buffer)
  local gs = package.loaded.gitsigns
  Nmap("<leader>gn", function()
    if vim.wo.diff then
      vim.cmd.normal({ "]c", bang = true })
    else
      gs.nav_hunk("next")
    end
  end, { desc = "Next Hunk", buffer = buffer })
  Nmap("<leader>gp", function()
    if vim.wo.diff then
      vim.cmd.normal({ "[c", bang = true })
    else
      gs.nav_hunk("prev")
    end
  end, { desc = "Prev Hunk", buffer = buffer })

  Nmap("<leader>gb", gs.reset_hunk, { desc = "Git Back Hunk", buffer = buffer })
  Nmap("<leader>gB", gs.reset_buffer, { desc = "Git Back File", buffer = buffer })
  Nmap("<leader>ga", gs.blame_line, { desc = "Git Anotate Line", buffer = buffer })
  Nmap("<leader>gA", gs.blame, { desc = "Git Anotate File", buffer = buffer })
end
