local pickers = require "telescope.pickers"
local entry_display = require "telescope.pickers.entry_display"
local finders = require "telescope.finders"
local previewers = require "telescope.previewers"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf = require("telescope.config").values

local himalaya = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "himalaya",
    finder = finders.new_dynamic(
      {
        fn = function()
          local result = {}
          local handle = io.popen("himalaya -o json list -s 1000")
          if handle then
            result = handle:read("*a")
            handle:close()
          end
          return vim.json.decode(result)
        end,
        entry_maker = function(entry)
          return {
            value = entry.id,
            display = entry_display.create({
              separator = ' ',
              items = {
                { width = 4 },
                { width = 20 },
                { width = 48 },
                { remaining = true }
              }
            })({
              entry.id,
              entry.date,
              entry.from.addr,
              entry.subject
            }),
            ordinal = entry.id,
          }
        end
      }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        print(vim.inspect(selection))
      end)
      return true
    end,
    previewer = previewers.new_termopen_previewer {
      get_command = function(entry)
        print(vim.inspect(entry))
        return { "himalaya", "read", entry.value }
      end
    }
  }):find()
end

-- to execute the function
-- himalaya(require("telescope.themes").get_ivy())

return himalaya
