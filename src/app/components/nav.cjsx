Nav = React.createClass
  render: ->
    <nav className="navbar navbar-dark bg-inverse">
      <a className="navbar-brand" href="#/">
        <i className="fa fa-cubes"></i> HipStack
      </a>
      <ul className="nav navbar-nav">
        <li className={"pull-right nav-item #{'active' if @props.state.pathname in ['/demo', '/']}"}>
          <a className="nav-link" href="#/demo">Demo</a>
        </li>
      </ul>
    </nav>
