local pickers = require 'telescope.pickers'
local himalaya = require('telescope._extensions.mountaineer_himalaya')


return require 'telescope'.register_extension {
  exports = {
    list = himalaya,
  },
}
