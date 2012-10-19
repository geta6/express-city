exports.DataController = (app) ->

  # object substitution.
  {Data} = app.settings.models

  return {
    index: (req, res, next) ->
      console.log "DataController.index"
      # Data.find~
      res.json 200, test: 'Hello City.'
  }
