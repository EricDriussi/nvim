local actions = require "telescope.actions"

require'telescope'.setup {
  defaults = {

    file_ignore_patterns = {"node_modules"},
    layout_config = {width = 0.90},
    prompt_prefix = "⫸ ",
    selection_caret = " ⮚ ",
    path_display = { "shortest" },

    mappings = {
      i = {
        ["<C-i>"] = actions.cycle_history_next,
        ["<C-o>"] = actions.cycle_history_prev,

        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,

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

      n = {
        ["<C-i>"] = actions.cycle_history_next,
        ["<C-o>"] = actions.cycle_history_prev,

        ["<esc>"] = actions.close,
        ["<C-w>"] = actions.close,
        ["<C-q>"] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.results_scrolling_up,
        ["<C-d>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

        ["?"] = actions.which_key,
      },
    },
  },
    pickers = {
        spell_suggest = {
            theme = "cursor",
            layout_config = {width = 25}
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
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
        ['ui-select'] = {
          layout_strategy = "cursor",
          layout_config = {width = 55, height = 8}
        }
      }
}
require'telescope'.load_extension('fzf')
require'telescope'.load_extension("ui-select")
