# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(document).on "click", "th a, ul.pagination a", (e) ->
    $.getScript @href
    false

  $(".search-form form").submit ->
    $.get @action, $(this).serialize(), null, "script"
    false