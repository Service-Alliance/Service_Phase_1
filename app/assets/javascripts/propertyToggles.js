var ready;
ready = function() {

    $(document).on('change', '#property_ownership', function(event) {
      if (this.checked) {
        $("#condo").removeClass("hidden")
      }
      else {
        $("#condo").addClass("hidden")
      }
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);
