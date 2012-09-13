ROOT_DIR = "#{__dirname}/.."
NODE_ENV = process.env.NODE_ENV

express  = require 'express'
assets   = require 'connect-assets'
mongoose = require 'mongoose'
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
      build: if NODE_ENV is 'production' then yes else no
      buildDir: no
      detectChange: if NODE_ENV is 'production' then no else yes
    app.use app.router

  app.configure 'development', ->
    app.use express.errorHandler()

  mongoose.connect app.settings.dbpath
