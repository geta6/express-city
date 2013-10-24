# Environment

process.env.NODE_ENV = 'test'

# Dependencies

_ = require 'underscore'
fs = require 'fs'
path = require 'path'
assert = require 'assert'
request = require 'supertest'
express = require '../config/app.coffee'
direquire = require 'direquire'

describe 'express-city', ->

  # direquire

  it 'should be load events from directory', (done) ->
    fromDir = direquire path.resolve 'events'
    fromApp = express.get 'events'
    return done null if _.keys(fromDir).toString() is _.keys(fromApp).toString()
    return done no

  it 'should be load models from directory', (done) ->
    fromDir = direquire path.resolve 'models'
    fromApp = express.get 'models'
    return done null if _.keys(fromDir).toString() is _.keys(fromApp).toString()
    return done no

  it 'should be load helper from directory', (done) ->
    fromDir = direquire path.resolve 'helper'
    fromApp = express.get 'helper'
    return done null if _.keys(fromDir).toString() is _.keys(fromApp).toString()
    return done no

  # テストすることがない

  it 'sohuld be index', (done) ->
    request(express)
      .get('/')
      .expect(200)
      .end done

  it 'should be static file serving', (done) ->
    request(express)
      .get('/css/style.css')
      .expect(200)
      .expect(fs.readFileSync path.resolve('dist', 'css', 'style.css'), 'utf-8')
      .end done

