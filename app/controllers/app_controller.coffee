exports.AppController = (app) ->

  fs = require 'fs'
  rs = require 'robotskirt'
  md = rs.Markdown.std()

  {App} = app.settings.models

  return {
    index: (req, res, next) ->
      res.render 'index'
        title: 'Express'
        html: md.render fs.readFileSync "#{__dirname}/../../README.md"
  }
