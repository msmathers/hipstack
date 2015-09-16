# Contrived library to manage Socket.io connection

class SocketIOEcho
  constructor: ->
    @io = io.connect()
