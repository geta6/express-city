ROOT_DIR = "#{__dirname}/.."

mongoose = require 'mongoose'
express  = require 'express'
assets   = require 'connect-assets'
packages = require "#{ROOT_DIR}/package.json"
logger   = require 'consolable'

# If ENV is production, logger log only errors.
logger.level process.env.NODE_ENV
logger.tag yes
logger.colorize no

{bundle} = require '../lib/bundle'

module.exports = (app) ->
  app.configure ->
    # `app.set 'example'` set to object `app.settings.example`
    app.set 'version', packages.version
    # `local` in package.json set to `app.settings.#{key}`
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
    # connect-assets changes a behavior depends on ENV.
    # e.g. uglify, compress, builds...
    app.use assets
      src: 'app/assets'
      build: yes
      buildDir: no
      detectChanges: yes
    app.use app.router

  app.configure 'development', ->
    app.use express.errorHandler()

  # MongoDB for data store.
  mongoose.connect app.settings.dbpath, (error) ->
    if error
      console.warn error
      console.error "failed on connecting #{app.settings.dbpath}"
    else
      console.info "MongoDB connected."

  # If you want to use connect- packages (e.g. passport)
  # setting up under this section.
