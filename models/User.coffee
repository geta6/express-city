mongoose = require 'mongoose'

UserModel = new mongoose.Schema
  id: type: Number, unique: yes
  name: type: String
  icon: type: String
  service: type: mongoose.Schema.Types.Mixed
  updated: type: Date
  created: type: Date
,
  versionKey: no

UserModel.statics.findOrCreateByTwitter = (token, secret, profile, done) ->
  now = new Date
  @findOne id: profile.id, (err, user) =>
    return done no if err
    unless user
      user = new @ { id: profile.id, created: now }
      user.service = []
    user.name = profile.username
    user.icon = profile.photos[0].value
    user.updated = now
    for service in user.service
      return user.save done if service.name is 'twitter'
    console.log user
    user.service.push
      name: 'twitter'
      token: token
      secret: secret
    user.save done

exports.User = mongoose.model 'users', UserModel
