# Hipstack

Starter kit for building modern web applications.

## Languages, libraries, and technologies

- [Coffeescript](http://coffeescript.org/) - Enhanced Javascript.
- [CoffeeJSX](https://github.com/jsdf/coffee-react-transform) - Coffee-flavored [JSX](https://facebook.github.io/jsx/), an XML-like Javascript syntax extention used by React.
- [React](https://facebook.github.io/react/) - Javascript library for building user interfaces.
- [ReactRouter](https://github.com/rackt/react-router) - Complete routing solution for React.
- [Socket.io](http://socket.io/) - Realtime browser/server communication library.
- [Axios](https://github.com/mzabriskie/axios) - [Promise](https://www.promisejs.org/)-based AJAX library.
- [Node.js](https://nodejs.org/en/) - Event-driven Javascript runtime for building servers.
- [Express](http://expressjs.com/) - Web server framework for Node.js
- [Passport.js](http://passportjs.org/) - Authentication middleware for Express.
- [Grunt](http://gruntjs.com/) - Javascript task runner.
- [Bower](http://bower.io/) - Package manager for browser Javascript libraries.
- [SASS](http://sass-lang.com/) - Enhanced CSS.
- [Bootstrap](http://v4-alpha.getbootstrap.com/) - CSS framework for building responsive, compliant UIs.
- [FontAwesome](https://fortawesome.github.io/Font-Awesome/) - Vector-based, CSS-customizable icon set.

## Code organization

- `src/app` - Browser-based application code.
- `src/app/components/*.cjsx` - React component definitions.
- `src/app/lib/*.coffee` - Framework-agnostic library code.
- `src/app/main.cjsx` - React routes and application initialization.
- `src/server` - Node.js web server code.
- `styles/*.scss` - Browser style definitions.
- `views/*.html` - Server-side HTML templates.
- `Gruntfile.coffee` - Build/dev task configuration.
- `bower.json` - Third-party browser library definitions.
- `package.json` - Third-party Node.js library definitions.

## Install & Run
```
npm install
npm run bower
npm start
```
To run the server with Google user authentication enabled, create [Google OAuth2 credentials](https://github.com/googleads/googleads-dotnet-lib/wiki/How-to-create-OAuth2-client-id-and-secret) and provide the following environment variables:
```
GOOGLE_CLIENT_ID=<...> GOOGLE_CLIENT_SECRET=<...> npm start
```
In your browser, go to
```
http://localhost:8999
```
## How-To

### Add third-party browser library

1. Add entry to `bower.json`
1. Run `npm run bower`
1. Locate .js file in `bower_components/<my_library>/`
1. Add `<script></script>` tag to `views/index.html`

### Add third-party server library

1. Add entry to `package.json`
1. Run `npm install`

### Add React Component

1. Create new `.cjsx` file in `src/app/components`

        MyNewComponent = React.createClass
          render: ->
            <div className="new-component-style">
              <p>Oh hai</p>
            </div>

1. (Optional) Add route to new component by adding `<Route>` tag in `src/app/main.cjsx`

### Add HTTP endpoint to server

1. Add route to `src/server/main.coffee`

        app.get '/hello/world', (req, res) ->
          res.json
            hello: 'world'

## Next Steps

1. Add a testing framework such as [Karma](http://karma-runner.github.io/0.13/index.html) or [Jasmine](http://jasmine.github.io/)
1. Include a database backend such as [PostgreSQL](http://www.postgresql.org/) or [MongoDB](https://www.mongodb.org/)
