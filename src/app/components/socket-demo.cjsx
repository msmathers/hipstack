SocketIODemo = React.createClass
  getInitialState: ->
    message: ''
    echo: ''

  componentWillMount: ->
    {@io} = @props.socket
    @io.on 'echo', (data) =>
      @setState echo: data.message

  messageChange: (e) ->
    @setState message: e.target.value

  sendMessage: (e) ->
    e.preventDefault()
    @io.emit 'echo',
      message: @state.message
    @setState message: ''

  render: ->
    echo = <SocketIOResponse message={@state.echo}/> if @state.echo
    <div>
      <form onSubmit={@sendMessage}>
        <fieldset className="form-group">
          <input className="form-control" onChange={@messageChange} value={@state.message} placeholder="Say Something" />
        </fieldset>
        <fieldset className="form-group">
          <button className="btn btn-primary">Send Message</button>
        </fieldset>
      </form>
      {echo}
    </div>

SocketIOResponse = React.createClass
  render: ->
    <div className="alert alert-info">
      Server says: {@props.message}
    </div>