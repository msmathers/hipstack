{Route, DefaultRoute} = ReactRouter

# Initialize app-wide resources
{user, userAuthDisabled} = window
socket = new SocketIOEcho

# Declare React app routes
routes =
  <Route handler={App} path="/">
    <DefaultRoute handler={Demo}/>
    <Route path="demo" handler={Demo}/>
  </Route>

# Initialize React app
ReactRouter.run routes, ReactRouter.HashLocation, (Root, state) ->
  root = <Root state={state} socket={socket} user={user} userAuthDisabled={userAuthDisabled}/>
  React.render root, document.body
  console.log "app started on: #{new Date()}"
