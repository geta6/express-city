mongoose = require 'mongoose'
Schema   = mongoose.Schema
{handle} = require '../../lib/handle'

UserSchema = new Schema
  name:
    type: String
    unique: yes
  email:
    type: String
    unique: yes  #【悲報】このユニークの設定のせいでfacebookデバッグが上手くいかず、２時間ぐらい費やした
  icon:
    type: String
  created:
    type: Date
    default: Date.now()
  follow:
    type: [String]      # !! user untouchable !!
  facebook:
    type: String      # stringified JSON
    set: handle.json.set
    get: handle.json.get
  twitter: String       # { uid, token, secret, rawinfo }
    set: handle.json.set
    get: handle.json.get

UserSchema.statics.items = (limit) ->
  result = Item.find owner: @
  result.limit(limit) if limit
  return result

module.exports =
  UserSchema: UserSchema
  User: mongoose.model 'users', UserSchema