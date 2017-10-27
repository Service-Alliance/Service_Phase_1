$(function() {
  $(document).on('click', '#customerZipLookup', function(event){

    event.preventDefault();
    customerZipLookup.call(this);
  });
});

function customerZipLookup(){
  var container = $(this).parents('.customer-address');
  var zip = container.find(".zip-code").val();

  $.ajax({
    method: "POST",
    url: '/addresses/geolocate',
    data: {'data': zip},
    dataType: 'json'
  })
  .done(function(response){
    if(response && response.length > 0) {
      var city = response[0]['data']['address_components'][1].long_name
      var county = response[0]['data']['address_components'][2].long_name
      var state = response[0]['data']['address_components'][3].short_name
      container.find('.city').val(city)
      container.find('.county').val(county)
      var state_val = container.find('.state-id option').filter(function () { return $(this).html() == state; }).val();
      container.find('.state').val(state_val)
    }
  })
}
