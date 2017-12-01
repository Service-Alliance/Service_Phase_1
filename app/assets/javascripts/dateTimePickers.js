var dateTimePickers = (function($) {
  var init = function() {
    $(document).ready(documentReadyHandler);
  }

  var documentReadyHandler = function() {
    initializePickers();
    $('form').on('cocoon:after-insert', initializePickers);
  }

  var initializePickers = function(e, context) {
    initializeTimePickers(context);
    initializeDatePickers(context);
    initializeDateTimePickers(context);
  }

  var initializeTimePickers = function(context) {
    $(context || document).find('.timepicker').each(function() {
      $this = $(this);
      var interval = $this.data('interval') || 30;
      $this.timepicker({
        timeFormat: 'h:mm p',
        interval: interval,
        minTime: '5',
        maxTime: '8:00pm',
        dynamic: false,
        dropdown: true,
        scrollbar: true
      });
    });
  }

  var initializeDatePickers = function(context) {
    $(context || document).find('.datepicker').flatpickr({
      enableTime: false,
      defaultDate: new Date(),
      altInput: true,
      altFormat: "F j, Y"
    });
  }

  var initializeDateTimePickers = function(context) {
    $(context || document).find('.datetimepicker').flatpickr({
      enableTime: true,
      defaultDate: new Date(),
      altInput: true,
      altFormat: "F j, Y h:i K"
    });
  }

  return {
    init: init
  }
})(jQuery);

dateTimePickers.init();
