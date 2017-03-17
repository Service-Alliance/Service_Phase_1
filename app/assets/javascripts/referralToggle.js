$(function() {
  $('input[type=radio][name=job\\[referral_type_id\\]]').change(function() {
      var $input = $('input[type=radio][name=job\\[referral_type_id\\]]:checked');
      var referralType = $('label[for=' + $input.attr('id') + ']').text();
      if (referralType == "Servpro Employee") {
        $("#referral_employee").removeClass("hidden");
        $("#referral_vendor").addClass("hidden");
      } else if (referralType == "Vendor"){
        $("#referral_vendor").removeClass("hidden");
        $("#referral_employee").addClass("hidden");
      }
      else {
        $("#referral_employee").addClass("hidden");
        $("#referral_vendor").addClass("hidden");
        $('#job_referral_employee_id').prop('selectedIndex',0);
        $('#job_referral_vendor_id').prop('selectedIndex',0);
      }
  });
});
