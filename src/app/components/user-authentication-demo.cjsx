UserAuthenticationDemo = React.createClass
  render: ->
    {user, disabled} = @props
    if disabled
      component = <UserAuthDisabled/>
    else if user
      component = <LoggedIn user={user}/>
    else
      component = <NotLoggedIn/>
    <div>{component}</div>

LoggedIn = React.createClass
  render: ->
    {firstName, lastName, provider} = @props.user
    <div>
      <p>
        <i className="fa fa-user"></i> Logged into <strong>{provider}</strong> as <strong>{firstName} {lastName}</strong>
      </p>
      <a className="btn btn-primary" href="/logout">Logout</a>
    </div>

NotLoggedIn = React.createClass
  render: ->
    <div className="user">
      <p>
        <i className="fa fa-user"></i> Not logged in.
      </p>
      <a className="btn btn-primary" href="/auth/google">Sign in to Google</a>
    </div>

UserAuthDisabled = React.createClass
  render: ->
    <div className="user-authentication-disabled">
      <div className="alert alert-danger text-center">
        <i className="fa fa-exclamation-triangle"></i> User authentication has been disabled.
      </div>
      <p>
        <small>
          Create <a href="https://github.com/googleads/googleads-dotnet-lib/wiki/How-to-create-OAuth2-client-id-and-secret">Google OAuth2 credentials</a> and do one of the following:
          <ul>
            <li>Run <code>npm start</code> with the environment variables <code>GOOGLE_CLIENT_ID</code> and <code>GOOGLE_CLIENT_SECRET</code></li>
            <li>Update the variables in <code>src/server/config.coffee</code></li>
          </ul>
        </small>
      </p>
    </div>