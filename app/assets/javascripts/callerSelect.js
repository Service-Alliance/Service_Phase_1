var ready;
ready = function() {
  $(document).on('change', '#call_id', function(event){
    event.preventDefault();
    var id = $("#call_id").val();

    $.ajax({
      method: "POST",
      url: '/calls/precall-lookup',
      data: {'id': id},
      dataType: 'json'
    })
    .success(function(response){
      customer_name = response.customer_name;
      customer_array = customer_name.split(' ');
      customer_city = response.customer_city;
      customer_zip = response.customer_zip;
      customer_state = response.customer_state;
      customer_phone_number = response.customer_phone_number;

      $("#caller_first_name").val(customer_array[0]);
      $("#caller_last_name").val(customer_array[1]);
      $("#address_city").val(customer_city);
      $("#address_zip_code").val(customer_zip);
      $("#phone_number").val(customer_phone_number);
      var state_val = $('#address_state_id option').filter(function () { return $(this).html() == customer_state; }).val();
      $("#address_state_id").val(state_val);

      // Run Zip lookup
      zipLookup();

    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
