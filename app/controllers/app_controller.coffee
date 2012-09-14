exports.AppController = (app) ->

  {App} = app.settings.models

  return {
    index: (req, res, next) ->
      res.render 'index'
        title: 'Express'
  }
