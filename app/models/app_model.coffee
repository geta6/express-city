mongoose = require 'mongoose'
Schema   = mongoose.Schema

AppSchema = new Schema
  title:
    type: String
  content:
    type: String

module.exports =
  AppSchema: AppSchema
  App: mongoose.model 'apps', AppSchema
