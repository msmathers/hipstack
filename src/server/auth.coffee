_ = require 'lodash'
express = require 'express'
passport = require 'passport'
GoogleStrategy = require('passport-google-oauth').OAuth2Strategy

passport.serializeUser (user, done) ->
  done null, user

passport.deserializeUser (obj, done) ->
  done null, obj

exports.googleOAuth2 = (config) ->
  # Create application server
  app = express()

  # Verify that GOOGLE_CLIENT_* configuration has been set
  # If not, don't use authentication middleware
  {GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET} = config
  if not GOOGLE_CLIENT_ID or not GOOGLE_CLIENT_SECRET
    console.warn "WARNING: Unable to find GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET
      in configuration, disabling user authentication middleware.
      \nTo enable, do one of the following:
      \n- Run 'npm start' with environment variables (GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET)
      \n- Update the configuration variables in 'src/server/config.coffee'"
    app.use (req, res, next) ->
      req.userAuthDisabled = true
      next()

  else
    # Register Google Oauth2 strategy
    googleParams =
      clientID: GOOGLE_CLIENT_ID
      clientSecret: GOOGLE_CLIENT_SECRET
      callbackURL: "#{config.SERVER_HOST}/auth/google/callback"
    passport.use new GoogleStrategy googleParams, (accessToken, refreshToken, profile, done) ->
      # Add custom user lookup/verification here.
      # For now, allow anyone from google to sign in
      done null,
        provider: profile.provider
        firstName: profile.name.givenName
        lastName: profile.name.familyName
        photoUrl: profile.photos[0]?.value

    # Register passport & related middleware
    app.use passport.initialize()
    app.use passport.session()

    # User authentication routes
    app.get '/auth/google',
      (passport.authenticate 'google', scope: ['https://www.googleapis.com/auth/plus.login']),
      (req, res) ->

    app.get '/auth/google/callback',
      (passport.authenticate 'google', failureRedirect: '/login'),
      (req, res) ->
        res.redirect '/'

    app.get '/logout', (req, res) ->
      req.logout()
      res.redirect '/'

  app
