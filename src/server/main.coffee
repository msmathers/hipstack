bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
express = require 'express'
path = require 'path'
io = require 'socket.io'
session = require 'cookie-session'
swig = require 'swig'

auth = require './auth'
config = require './config'

# Create application server
app = express()
app.use cookieParser()
app.use bodyParser.urlencoded
  extended: true
app.use bodyParser.json()
app.use session
  name: 'hipstack:app'
  secret: 'this is super secret guys!'

# Set template rendering
rootDir = path.dirname __dirname
viewPath = path.join rootDir, '../views'
app.engine 'html', swig.renderFile
app.set 'view engine', 'html'
app.set 'views', viewPath
app.set 'view cache', false
swig.setDefaults cache: false

# Add Google OAuth2 authentication
app.use auth.googleOAuth2 config

# Serve static files (for JS, CSS)
app.use '/vendor', express.static 'bower_components'
app.use '/static', express.static 'static'

# Route definitions
app.get '/', (req, res) ->
  res.render 'index.html',
    user: JSON.stringify (req.user or null)
    userAuthDisabled: req.userAuthDisabled or false

app.post '/echo', (req, res) ->
  res.json req.body

# Start Server
server = app.listen 8999, ->
  console.log "Server listening on port: #{server.address().port}"

# Bind socket.io events
io = io server
io.on 'connection', (socket) ->
  socket.on 'echo', (data) ->
    socket.emit 'echo', data
