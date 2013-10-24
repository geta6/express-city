exports.regexpEscape = (src) ->
  return src.replace /([.*+?^${}()|[\]\/\\])/g, '\\$1'
