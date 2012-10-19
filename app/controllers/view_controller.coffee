exports.ViewController = (app) ->

  return {
    index: (req, res, next) ->
      console.log "ViewController.index"
      res.render 'index'
        req: req
  }