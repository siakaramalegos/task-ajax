jQuery ->
  $('body').prepend('<div id="fb-root"></div')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true

# TODO:  change app id to use environment variable, if possible
window.fbAsyncInit = ->
  FB.init(appId: '358964684302521', cookie: true)

  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/auth/facebook/callback' if response.authResponse

  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true