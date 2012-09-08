exports.AppController = (app) ->

  ROOT_DIR = "#{__dirname}/../.."

  {App} = app.settings.models

  return {
    index: (req, res, next) ->
      res.render 'index'
        title: 'Express'
  }
