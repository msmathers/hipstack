AjaxDemo = React.createClass
  getInitialState: ->
    message: ''
    echo: ''

  componentWillMount: ->
    @ajax = new AjaxEcho

  messageChange: (e) ->
    @setState message: e.target.value

  sendMessage: (e) ->
    e.preventDefault()
    @ajax.sendMessage @state.message
      .then (message) =>
        @setState
          echo: message
          message: ''

  render: ->
    echo = <AjaxResponse message={@state.echo}/> if @state.echo
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

AjaxResponse = React.createClass
  render: ->
    <div className="alert alert-info">
      Server says: {@props.message}
    </div>