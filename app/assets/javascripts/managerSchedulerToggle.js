$(function() {
  $('input[type=radio][name=scheduler\\[scheduler_event_type_id\\]]').change(function() {
      var $input = $('input[type=radio][name=scheduler\\[scheduler_event_type_id\\]]:checked');
      var referralType = $input.val();
      console.log(referralType)
      if (referralType == 5) {
        $("#manager-assign-to-user").removeClass("hidden");
        $("#other-assign-to-user").addClass("hidden");
      } else {
        $("#manager-assign-to-user").addClass("hidden");
        $("#other-assign-to-user").removeClass("hidden");
      }
  });
});
