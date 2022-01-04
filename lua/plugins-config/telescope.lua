local actions = require "telescope.actions"

require'telescope'.setup {
  defaults = {

file_ignore_patterns = {"node_modules"},
    prompt_prefix = "⫸ ",
    selection_caret = " ⮚ ",
    path_display = { "smart" },

    mappings = {
      i = {
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
        lsp_code_actions = {
            theme = "cursor",
        },
        find_files = {
            theme = "dropdown",
            previewer = false
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
      }
}
require'telescope'.load_extension('fzf')
