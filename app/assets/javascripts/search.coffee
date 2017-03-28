# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#search_name').change ->
    $("select#search_name").attr("defaultValue", "newValue");
    $.ajax '/search',
    type: 'GET'
    dataType: 'html'
    data: {"search": {"name": $('#search_name').val(), "subject": $('#search_subject option:selected').val()}}
    error: (jqXHR, textStatus, errorThrown) ->
      alert jqXHR+textStatus
    success: (data) ->
      $("#search_results").html(data)


  $('#search_subject').change ->
    $.ajax '/search',
    type: 'GET'
    dataType: 'html'
    data: {"search": {"name": $('#search_name').val(), "subject": $('#search_subject option:selected').val()}}
    error: (jqXHR, textStatus, errorThrown) ->
      alert jqXHR+textStatus
    success: (data) ->
      $("#search_results").html(data)
