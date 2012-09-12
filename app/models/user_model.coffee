mongoose = require 'mongoose'
Schema   = mongoose.Schema
{handle} = require '../../lib/handle'

UserSchema = new Schema
  uid:
    type: String
  name:
    type: String

module.exports =
  UserSchema: UserSchema
  User: mongoose.model 'users', UserSchema
