
var ready;
ready = function() {
  $(document).on('change', '#loss_loss_type_id', function(event){

    var lossType =  $( "#loss_loss_type_id option:selected" ).text();

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
