var ready;
ready = function() {
  $(document).on('click', '#zipLookup', function(event){
    event.preventDefault();
    var zip = $("#address_zip_code").val();

    $.ajax({
      method: "POST",
      url: '/addresses/geolocate',
      data: {'data': zip},
      dataType: 'json'
    })
    .success(function(response){
      var city = response[0]['data']['address_components'][1].long_name
      var county = response[0]['data']['address_components'][2].long_name
      var state = response[0]['data']['address_components'][3].short_name
      $("#address_city").val(city)
      $("#address_county").val(county)
      var state_val = $('#address_state_id option').filter(function () { return $(this).html() == state; }).val();
      $("#address_state_id").val(state_val)
    })
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
