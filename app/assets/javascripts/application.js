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
//= require bootstrap/modal
//= require bootstrap/transition
//= require jasny-bootstrap.min
//= require rails-ujs
//= require turbolinks
//= require jquery-ui
//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/position
//= require toastr
//= require spin
//= require jquery.spin
//= require_tree .


// For Rails 5 Use the jquery.turbolinks gem and using
// $( document ).on('turbolinks:load', function() {
//   // your code
// }


$( document ).on('turbolinks:load', function() {
    $('#term').autocomplete({
        source: "/contacts/autocomplete",
        minLength: 3,
        select: function (event, ui) {
            $('#term').val(ui.item.value);
            $(this).closest('form').submit();
        }
    });
    // $('#form-modal-save-btn').click(function() {
    //     $('#new_contact').submit();
    // });
    // $(document).on("page:fetch", function(){
    //   $("#abc").show();
    //   $("#abc").spin(true);
    // });
    //
    // $(document).on("page:receive", function(){
    //   $("#abc").hide();
    //   $("#abc").spin(false);
    // });

    $('#ajax-spin').hide();
    $('#abc').hide();

     // Shows the default spinner

    // $(".spinner").hide();
    //
    // $(document).ajaxStart(function() {
    //   $(".spinner").fadeIn('slow');
    // }).ajaxStop(function() {
    //     $(".spinner").hide();
    // })

});

// default

$(document).ajaxStart(function () {
    $('#ajax-spin').spin({
          lines: 13 // The number of lines to draw
        , length: 28 // The length of each line
        , width: 14 // The line thickness
        , radius: 42 // The radius of the inner circle
        , scale: 1 // Scales overall size of the spinner
        , corners: 1 // Corner roundness (0..1)
        , color: '#F62217' // #rgb or #rrggbb or array of colors
        , opacity: 0.25 // Opacity of the lines
        , rotate: 0 // The rotation offset
        , direction: 1 // 1: clockwise, -1: counterclockwise
        , speed: 1 // Rounds per second
        , trail: 60 // Afterglow percentage
        , fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
        , zIndex: 2e9 // The z-index (defaults to 2000000000)
        , className: 'spinner' // The CSS class to assign to the spinner
        , top: '50%' // Top position relative to parent
        , left: '50%' // Left position relative to parent
        , shadow: false // Whether to render a shadow
        , hwaccel: false // Whether to use hardware acceleration
        , position: 'absolute' // Element positioning
    });
    $('#ajax-spin').show();
    $('#abc').spin({
      lines: 12, // The number of lines to draw
      length: 7, // The length of each line
      width: 9, // The line thickness
      radius: 18, // The radius of the inner circle
      direction: -1,
      color: '#000', // #rgb or #rrggbb
      speed: 0.5, // Rounds per second
      trail: 60, // Afterglow percentage
      shadow: false // Whether to render a shadow
    });
    $('#abc').show();
});

$(document).ajaxStop(function () {
    $('#ajax-spin').delay(1800).fadeOut('slow');
    $('#abc').delay(1800).fadeOut('slow');
});

//history.pushState(state, title, url)

$(document).on('click', '.pagination a[data-remote=true], a.list-group-item', function() {
  history.pushState({}, '', $(this).attr('href'));
});

$(window).on('popstate', function() {
  $.get(document.location.href);
});
// $(document).ready(function() {
//   $("#myInput").on("keyup", function() {
//     var value = $(this).val().toLowerCase();
//     $("#myTable tr").filter(function() {
//       $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
//     });
//   });
// });

// $(document).ready( function() {
//     //$('.alert').delay(3000).fadeOut();
//     $(".alert-danger" ).fadeOut(3000);
// });



/*global toastr*/
toastr.options = {
  "closeButton": true,
  "debug": false,
  "positionClass": "toast-top-right",
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}
