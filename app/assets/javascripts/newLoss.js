
var ready;
ready = function() {
  $('input[type=radio][name=loss\\[loss_type_id\\]]').change(function() {

    var $input = $('input[type=radio][name=loss\\[loss_type_id\\]]:checked');
    var lossType = $('label[for=' + $input.attr('id') + ']').text();


    if (lossType === "General Cleaning") {
        $("#cleaningType").removeClass("hidden");
        $("#squareFootage").addClass("hidden");
        $("#sourceCause").addClass("hidden");
        $("#previousWater").addClass("hidden");
    }
    else if(lossType === "Mold"){
      $("#squareFootage").removeClass("hidden");
      $("#previousWater").removeClass("hidden");
      $("#cleaningType").addClass("hidden");
    }
    else if(lossType === "Fire" || lossType === "Smoke" || lossType === "Fire/Water"){
      $("#sourceCause").removeClass("hidden");
      $("#cleaningType").addClass("hidden");
      $("#squareFootage").addClass("hidden");
      $("#previousWater").addClass("hidden");
    }
    else {
      $("#cleaningType").addClass("hidden");
      $("#squareFootage").addClass("hidden");
      $("#previousWater").addClass("hidden");
    }
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
