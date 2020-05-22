import '../stylesheets/application'
import 'materialize-css/dist/js/materialize'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

$(document).on ('turbolinks:load', function() {
  $(".dropdown-trigger").dropdown({
    constrainWidth: false,
  });
  $('select').formSelect();
  $('.collapsible').collapsible();

  $(".datepicker").datepicker({
    autoClose: false,
    format: 'dd/mm/yyyy',
    showClearBtn: true,
    i18n: {
      months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
      monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
      weekdays: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
      weekdaysShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
      today: 'Hoje',
      selectMonths: true,
    }
  })
})
