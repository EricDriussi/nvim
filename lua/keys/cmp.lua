local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return function(cmp)
  return {
    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

    ["<C-k>"] = cmp.mapping.scroll_docs(-4),
    ["<C-j>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
    ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      local copilot_ok, copilot_suggestion = pcall(require, "copilot.suggestion")
      if vim.snippet.active({ direction = 1 }) then
        vim.schedule(function()
          vim.snippet.jump(1)
        end)
      elseif copilot_ok and copilot_suggestion.is_visible() then
        copilot_suggestion.accept()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      local copilot_ok, copilot_suggestion = pcall(require, "copilot.suggestion")
      if vim.snippet.active({ direction = -1 }) then
        vim.schedule(function()
          vim.snippet.jump(-1)
        end)
      elseif copilot_ok and copilot_suggestion.is_visible() then
        copilot_suggestion.next()
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end
