$(function() {
  $(document).on('click', '#customerZipLookup', function(event){

    event.preventDefault();
    customerZipLookup();
  });
});

function customerZipLookup(){
  var zip = $("#customer_address_zip_code").val();

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
    $("#customer_address_city").val(city)
    $("#customer_address_county").val(county)
    var state_val = $('#customer_address_state_id option').filter(function () { return $(this).html() == state; }).val();
    $("#customer_address_state_id").val(state_val)
  })
}
