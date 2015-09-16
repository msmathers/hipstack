# Contrived library to issue AJAX requests

class AjaxEcho
  sendMessage: (message) ->
    axios.post '/echo', message: message
      .then (res) =>
        res.data.message
