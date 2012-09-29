ROOT_DIR = "#{__dirname}/.."

mongoose = require 'mongoose'
express  = require 'express'
assets   = require 'connect-assets'
packages = require "#{ROOT_DIR}/package.json"

{bundle} = require '../lib/bundle'

module.exports = (app) ->
  app.configure ->
    app.set 'version', packages.version
    app.set k, v for k, v of packages.local
    app.set 'port', process.env.PORT || app.settings.port
    app.set 'models', bundle "#{ROOT_DIR}/app/models"
    app.set 'controllers', bundle "#{ROOT_DIR}/app/controllers"
    app.set 'views', "#{ROOT_DIR}/app/views"
    app.set 'view engine', 'jade'
    app.use express.favicon()
    app.use express.logger 'dev'
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use express.static "#{ROOT_DIR}/public"
    app.use assets
      src: 'app/assets'
      build: yes
      buildDir: no
      detectChanges: yes
    app.use app.router

  app.configure 'development', ->
    app.use express.errorHandler()

  mongoose.connect app.settings.dbpath, (error) ->
    if error
      console.error (String error).red
      process.exit 2
