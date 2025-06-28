local old_error = _G.error

require('lldebugger').start()

_G.error = old_error
