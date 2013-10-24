exports.Session = (app) ->

  passport = require 'passport'
  {User} = app.get 'models'

  create: (req, res) ->
    res.setHeader 'Cache-Control', 'no-cache, no-store, must-revalidate'
    return passport.authenticate('twitter').apply @, arguments

  delete: (req, res) ->
    res.setHeader 'Cache-Control', 'no-cache, no-store, must-revalidate'
    req.logout()
    return res.redirect 'back'

  verify: passport.authenticate 'twitter',
    failureRedirect: '/'
    successRedirect: '/'

