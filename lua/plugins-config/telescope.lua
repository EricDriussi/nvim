local telescope = require("telescope")
local actions = require("telescope.actions")
local config = require("telescope.config")

local find_files_command = { "rg", "--hidden", "--files", "--glob", "!.git" }
local find_strings_command = { "rg", "--hidden", "--glob", "!.git/*" }

local default_vimgrep_args = { unpack(config.values.vimgrep_arguments) }
local updated_vimgrep_args = vim.tbl_deep_extend(
  'force',
  default_vimgrep_args,
  find_strings_command
)

local custom_ivy = {
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
    prompt_prefix = "🔎 ",
    selection_caret = " ⮚ ",
    path_display = { "shortest" },
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = "top",
      width = 0.90
    },
    vimgrep_arguments = updated_vimgrep_args,

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
    find_files = { find_command = find_files_command },
    lsp_definitions = custom_ivy,
    lsp_implementations = custom_ivy,
    lsp_references = custom_ivy
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
