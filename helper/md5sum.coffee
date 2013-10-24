crypto = require 'crypto'

exports.md5sum = (src) ->
  md5 = crypto.createHash 'md5'
  md5.update src, 'utf8'
  return md5.digest 'hex'
