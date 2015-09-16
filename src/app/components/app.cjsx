{RouteHandler} = ReactRouter

App = React.createClass
  render: ->
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <Nav state={@props.state}/>
        </div>
      </div>
      <div className="row">
        <div className="col-sm-12">
          <RouteHandler socket={@props.socket} user={@props.user} userAuthDisabled={@props.userAuthDisabled}/>
        </div>
      </div>
      <div className="row">
        <div className="col-sm-12">
          <footer>
            <p><i className="fa fa-hand-peace-o"></i></p>
            <p>Baked in 2015 using hipster technologies from 2013</p>
          </footer>
        </div>
      </div>
    </div>
