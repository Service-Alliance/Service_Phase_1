// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap-sprockets
//= require select2-full
//= require Chart.bundle
//= require chartkick
//= require best_in_place
//= require timepicker.min
//= require_tree .

$(function() {
  $("a.tooltipLink").tooltip();
  $(".select-control").select2({
    placeholder: "Select an option",
    allowClear: true
  });
  $('.timepicker').timepicker({
      timeFormat: 'h:mm p',
      interval: 30,
      minTime: '5',
      maxTime: '8:00pm',
      dynamic: false,
      dropdown: true,
      scrollbar: true
  });
});
