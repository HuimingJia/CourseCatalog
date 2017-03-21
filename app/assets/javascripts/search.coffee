# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  console.log "ajax"
  $('input#search_name').change ->
    $("select#search_name").attr("defaultValue", "newValue");
    $.ajax '/search',
    type: 'GET'
    dataType: 'html'
    data: {"search": {"name": $('input#search_name').val(), "subject": $('select#search_subject option:selected').val()}}
    error: (jqXHR, textStatus, errorThrown) ->
      alert jqXHR+textStatus
    success: (data) ->
      $("#search_results").html(data)

  $('select#search_subject').change ->
    $.ajax '/search',
    type: 'GET'
    dataType: 'html'
    data: {"search": {"name": $('input#search_name').val(), "subject": $('select#search_subject option:selected').val()}}
    error: (jqXHR, textStatus, errorThrown) ->
      alert jqXHR+textStatus
    success: (data) ->
      $("#search_results").html(data)
