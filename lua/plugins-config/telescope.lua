local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local actions = require "telescope.actions"

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

    pickers = {
      spell_suggest = {
        theme = "cursor",
        layout_config = { width = 25 },
      },
      find_files = {
        theme = "dropdown",
        previewer = false
      },
      lsp_definitions = {
        theme = "ivy"
      },
      lsp_implementations = {
        theme = "ivy"
      },
      lsp_references = {
        theme = "ivy"
      }
    },

    mappings = {
      i = {
        ["<C-i>"] = actions.cycle_history_next,
        ["<C-o>"] = actions.cycle_history_prev,

        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,

        ["<esc>"] = actions.close,
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

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },
    },
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
      layout_config = { width = 55, height = 8 }
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension("ui-select")
