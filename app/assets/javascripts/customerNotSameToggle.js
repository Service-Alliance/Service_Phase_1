var ready;
ready = function() {

    $(document).on('change', '#same_caller_same_indicator', function(event) {
      var selectedVal = $("#same_caller_same_indicator").is(":checked");
      if (selectedVal == true) {
        $("#customer-btn").addClass("hidden");
      }
      else {
        $("#customer-btn").removeClass("hidden");

      }
    });


};

$(document).ready(ready);
$(document).on('page:load', ready);
