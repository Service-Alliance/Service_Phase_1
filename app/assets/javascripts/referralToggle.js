$(function() {
  $('input[type=radio][name=job\\[referral_type_id\\]]').change(function() {
      var $input = $('input[type=radio][name=job\\[referral_type_id\\]]:checked');
      var referralType = $('label[for=' + $input.attr('id') + ']').text();
      if (referralType == "Servpro Employee") {
        $("#referral_employee").removeClass("hidden");
      }
      else {
        $("#referral_employee").addClass("hidden");
        $('#job_referral_employee_id').prop('selectedIndex',0);
      }
  });
});
