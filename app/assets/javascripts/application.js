// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap/dropdown
//= require jasny-bootstrap.min
//= require rails-ujs
//= require turbolinks
//= require jquery-ui
//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/position
//= require_tree .


// For Rails 5 Use the jquery.turbolinks gem and using
// $( document ).on('turbolinks:load', function() {
//   // your code
// }


$(document).on('turbolinks:load', function() {
  $('#term').autocomplete({
    source: "/contacts/autocomplete",
    minLength: 3,
    select: function(event, ui) {
      $('#term').val(ui.item.value);
      $(this).closest('form').submit();
    }
  });

  $('#alert-mongoloid').delay(2000).slideUp(500, function() {
    $('#alert-mongoloid').alert('close');
  });
});

$(document).ready(function() {
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

// $(document).ready( function() {
//     //$('.alert').delay(3000).fadeOut();
//     $(".alert-danger" ).fadeOut(3000);
// });
