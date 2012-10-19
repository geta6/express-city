mongoose = require 'mongoose'
Schema   = mongoose.Schema

DataSchema = new Schema
  title:
    type: String
  content:
    type: String

# Data expression defines here.

# DataSchema.statics.findTest = (callback) ->
#   @find a, b, c, callback e, data ->

# Expression is available with...
#   {Data} = app.settings.models
#   Data.findTest (e, data) ->

module.exports =
  DataSchema: DataSchema
  Data: mongoose.model 'data', DataSchema
