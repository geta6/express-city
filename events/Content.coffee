exports.Content = (app) ->

  {User} = app.get 'models'

  index: (req, res) ->
    return res.render 'index', title: 'Express City'

  user: (req, res, next) ->
    User.findOne name: req.params.username, {}, {}, (err, user) ->
      console.error err if err
      return next() unless user
      return res.render 'user', user: user

