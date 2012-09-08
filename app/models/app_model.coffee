mongoose = require 'mongoose'
Schema   = mongoose.Schema

AppSchema = new Schema

module.exports =
  AppSchema: AppSchema
  App: mongoose.model 'apps', AppSchema