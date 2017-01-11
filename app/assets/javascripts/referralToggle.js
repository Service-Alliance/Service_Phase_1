$(function() {
  $('input[type=radio][name=job\\[referral_type_id\\]]').change(function() {
      var $input = $('input[type=radio][name=job\\[referral_type_id\\]]:checked');
      var referralType = $('label[for=' + $input.attr('id') + ']').text();
      var escaped_referralType = referralType.replace(/([ #/.?*+^$[\]\\(){}|-])/g, "\\$1");
      console.log(referralType)
      if (referralType == "Servpro Employee") {
        $("#referral_employee").removeClass("hidden");
        console.log('yooo')
      }
      else {
        $("#referral_employee").addClass("hidden");
        $('#job_referral_employee_id').prop('selectedIndex',0);
      }
  });
});
