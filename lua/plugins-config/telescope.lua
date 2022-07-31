local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local actions = require "telescope.actions"

local my_ivy_config = {
  theme = "ivy",
  layout_config = { height = 0.35 },
  on_complete = {
    function()
      vim.cmd('stopinsert')
    end
  }
}

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules" },
    prompt_prefix = "⫸ ",
    selection_caret = " ⮚ ",
    path_display = { "shortest" },
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = "top",
      width = 0.90
    },

    mappings = {
      i = {
        ["<C-i>"] = actions.cycle_history_next,
        ["<C-o>"] = actions.cycle_history_prev,

        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,

        ["<Esc>"] = actions.close,
        ["<C-w>"] = actions.close,
        ["<C-q>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.results_scrolling_up,
        ["<C-d>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },
      n = {
        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,

        ["<Esc>"] = actions.close,
        ["<C-w>"] = actions.close,
        ["<C-q>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.results_scrolling_up,
        ["<C-d>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },
    },
  },

  pickers = {
    spell_suggest = {
      theme = "cursor",
      layout_config = { width = 0.25 },
      on_complete = {
        function()
          vim.cmd('stopinsert')
        end
      }
    },
    find_files = {
      theme = "dropdown",
      previewer = false
    },
    lsp_definitions = my_ivy_config,
    lsp_implementations = my_ivy_config,
    lsp_references = my_ivy_config
  },

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    ['ui-select'] = {
      layout_strategy = "cursor",
      layout_config = { width = 0.4, height = 0.3 },
      on_complete = {
        function()
          vim.cmd('stopinsert')
        end
      }
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension("ui-select")
