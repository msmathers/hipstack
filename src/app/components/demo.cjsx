Demo = React.createClass
  render: ->
    <div className="status m-t">
      <div className="card-deck-wrapper">
        <div className="card-deck">
          <div className="card">
            <div className="card-header">
              Socket.io Demo
            </div>
            <div className="card-block text-center">
              <SocketIODemo socket={@props.socket}/>
            </div>
          </div>
          <div className="card">
            <div className="card-header">
              Ajax Demo
            </div>
            <div className="card-block text-center">
              <AjaxDemo/>
            </div>
          </div>
          <div className="card">
            <div className="card-header">
               User Authentication
            </div>
            <div className="card-block text-center">
              <UserAuthenticationDemo user={@props.user} disabled={@props.userAuthDisabled}/>
            </div>
          </div>
        </div>
      </div>
    </div>
