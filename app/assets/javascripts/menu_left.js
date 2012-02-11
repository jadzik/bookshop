$(document).ready ->
   App.showAlert("ohai")

window.App = {

   showAlert: (message) ->
       alert(message)

}