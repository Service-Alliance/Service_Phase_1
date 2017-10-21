$(function() {

  if($('.loss-cause').length !== 0) {

    var $input = $('.loss-type:checked');
    var lossType = $input.parent().text();
    updateLossInfo($input, lossType);


    $('input.loss-type[type=radio]').change(function() {
      var $input = $(this);
      var lossType = $input.parent().text();
      updateLossInfo($input, lossType)
    });
  }

});


function updateLossInfo(input, lossType) {
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
}
