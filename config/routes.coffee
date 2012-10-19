module.exports = (app) ->

  ### Controller ###
  controllers   = app.settings.controllers
  # Controllers are function, pass `app` at first argument.
  ViewController = controllers.ViewController app
  DataController = controllers.DataController app

  ### Routing ###
  app.get '/'             , ViewController.index
  # For backbone.
  app.put /^\/(.*)\.json$/, DataController.index

  ### Fallback ###
  # Should handle the fallback(404) with front server.
  app.all /.*/, (req, res, next) ->
    console.log "Fallback."
    res.writeHead 404, 'Content-Type': 'text/html'
    res.end (require 'fs').readFileSync "#{__dirname}/../public/404.html"
