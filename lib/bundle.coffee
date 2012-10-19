fs   = require 'fs'
path = require 'path'

# Return files end with .coffee or .js under specified directory.
exports.bundle = (dirname) ->
  bundle = {}
  for filename in fs.readdirSync dirname
    extname = path.extname filename
    if extname.match /\.(coffee|js)/
      for k, v of require path.resolve(path.join(dirname, filename))
        bundle[k] = v
  bundle
