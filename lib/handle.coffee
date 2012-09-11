fs   = require 'fs'
path = require 'path'

exports.handle = (dirname) ->
  json:
    get: (string) ->
      JSON.parse string
    set: (object) ->
      JSON.stringify object
