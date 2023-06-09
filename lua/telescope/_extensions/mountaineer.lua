local m_builtin = require 'telescope._extensions.mountaineer_builtin'

return require 'telescope'.register_extension {
  exports = {
    list = m_builtin.list,
  },
}
