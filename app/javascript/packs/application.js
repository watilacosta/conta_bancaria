import '../stylesheets/application'
import 'materialize-css/dist/js/materialize'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

$(document).on ('turbolinks:load', function() {
  $(".dropdown-trigger").dropdown();
  $('select').formSelect();
  $('.collapsible').collapsible();
})