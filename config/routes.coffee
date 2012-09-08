module.exports = (app) ->

  # Controller
  controllers   = app.settings.controllers
  AppController = controllers.AppController app

  # Routing
  app.get '/', AppController.index

  # Failed
