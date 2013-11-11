# Dependency

fs = require 'fs'
path = require 'path'
util = require 'util'
express = require 'express'
mongoose = require 'mongoose'
passport = require 'passport'
direquire = require 'direquire'

# Environment

for k, v of require path.resolve 'config', 'env.json'
  process.env[k.toUpperCase()] = v

# Database

mongoose.connect process.env.MONGO

# Application

app = module.exports = ( ->
  app = express()
  app.disable 'x-powerd-by'
  app.set 'events', direquire 'events'
  app.set 'models', direquire 'models'
  app.set 'helper', direquire 'helper'
  app.set 'views', path.resolve 'views'
  app.set 'view engine', 'jade'
  app.set 'session', new ((require 'connect-mongo') express)
    mongoose_connection: mongoose.connections[0]
  app.use express.favicon()
  unless process.env.NODE_ENV is 'test'
    app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session
    store: app.get 'session'
    secret: process.env.TOKEN
    cookie: expires: new Date Date.now() + 10 * 365 * 24 * 60 * 60
  app.use passport.initialize()
  app.use passport.session()
  app.use (req, res, next) ->
    app.locals.pretty = process.env.NODE_ENV isnt 'production'
    app.locals.req = req
    app.locals.res = res
    return next()
  app.use app.router
  if process.env.NODE_ENV is 'production'
    app.use express.static path.resolve 'public'
  else
    app.use express.static path.resolve 'dist'
  app.use express.errorHandler()
  return app
)()

# Authenticate

( ->
  {User} = app.get 'models'
  passport.serializeUser (user, done) ->
    done null, user
  passport.deserializeUser (user, done) ->
    User.findOne _id: user._id, done
  passport.use new (require 'passport-twitter').Strategy
    consumerKey: process.env.TOKEN_KEY
    consumerSecret: process.env.TOKEN_SEC
    callbackURL: "#{process.env.URI}/session/callback"
  , (token, secret, profile, done) ->
    process.nextTick ->
      User.findOrCreateByTwitter token, secret, profile, done
)()

# Routes

( ->
  Session = (app.get 'events').Session app
  Content = (app.get 'events').Content app

  ensure = (req, res, next) ->
    return res.redirect '/' unless req.isAuthenticated()
    return next()

  app.get '/session',                  Session.create
  app.get '/session/logout',           Session.delete
  app.get '/session/callback',         Session.verify
  app.get '/',                         Content.index
  app.get '/:username',        ensure, Content.user

)()

