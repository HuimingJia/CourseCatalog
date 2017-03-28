// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
$(document).ready(function(){
  $("#search_name").change(function(){
    $("#search_name").attr("defaultValue", "newValue");
    $.ajax({
        type: "GET",
        url: '/search',
        data: {"search": {"name": $('input#search_name').val(), "subject": $('select#search_subject option:selected').val()}},
        dataType: "html",
        success:function(data){
          $("#search_results").html(data)
        },
        error:function(jqXHR){
          alert(jqXHR)
        }
    });

  });

  $("#search_subject").change(function(){
    $.ajax({
        type: "GET",
        url: '/search',
        data: {"search": {"name": $('input#search_name').val(), "subject": $('select#search_subject option:selected').val()}},
        dataType: "html",
        success:function(data){
          $("#search_results").html(data)
        },
        error:function(jqXHR){
          alert(jqXHR+textStatus)
        }
    });
  });
});
