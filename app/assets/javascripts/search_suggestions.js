$(function () {
$( "#caller_search" ).autocomplete({
      // source: "/customer_search_suggestions",
      source: function (request, response) {
        $.getJSON("/caller_search_suggestions?term=" + request.term, function (data) {
          response($.map(data, function (value, key) {
            return {
              label: "Caller: "+ value.first_name + " " + value.last_name,
              value: value
            }
          }));
        });
      },
      select: function( event, ui ) {
        event.preventDefault();
        $("#caller_caller_exists").val(1)
        $("#caller_search").val(ui.item.value.first_name)
        $("#caller_first_name").val(ui.item.value.first_name);
        $("#caller_last_name").val(ui.item.value.last_name);
        $("#caller_email").val(ui.item.value.email);
        $("#address_address_1").val(ui.item.value.address.address_1);
        $("#address_address_2").val(ui.item.value.address.address_2);
        $("#address_zip_code").val(ui.item.value.address.zip_code);
        $("#address_city").val(ui.item.value.address.city);
        $("#address_county").val(ui.item.value.address.county);
        $("#address_state_id").val(ui.item.value.address.state_id);

        $.each(ui.item.value.phones, function( index, value ) {
          $("#add-number" ).trigger( "click" );
          $('#submit-job').prop('disabled', false);
          $("#phones_numbers_").first().val(value.number)
          $("#phones_extensions_").first().val(value.extension)
          $("#phones_type_ids_").first().val(value.type_id);
        });
      }
    } );
  }
)



$(function () {
$( "#customer_search" ).autocomplete({
      source: function (request, response) {
        $.getJSON("/customer_search_suggestions?term=" + request.term, function (data) {
          response($.map(data, function (value, key) {
            console.log(value)
            return {
              label: "Customer: "+ value.first_name + " " + value.last_name,
              value: value
            }
          }));
        });
      },
      select: function( event, ui ) {
        event.preventDefault();
        $("#editing-customer").removeClass("hidden")
        $("#customer-form #customer_exists_customer_id").val(ui.item.value.id)
        $("#customer-form #customer_search").val(ui.item.value.first_name)
        $("#customer-form #customer_first_name").val(ui.item.value.first_name);
        $("#customer-form #customer_last_name").val(ui.item.value.last_name);
        $("#customer-form #customer_email").val(ui.item.value.email);
        $("#customer-form #address_address_1").val(ui.item.value.address.address_1);
        $("#customer-form #address_address_2").val(ui.item.value.address.address_2);
        $("#customer-form #address_zip_code").val(ui.item.value.address.zip_code);
        $("#customer-form #address_city").val(ui.item.value.address.city);
        $("#customer-form #address_county").val(ui.item.value.address.county);
        $("#customer-form #address_state_id").val(ui.item.value.address.state_id);
        $("#customer-name").val(ui.item.value.first_name + " " + ui.item.value.last_name)

        $.each(ui.item.value.phones, function( index, value ) {
          $("#modal-new-number #modal-add-number" ).trigger( "click" );
          $("#modal-number-container #phones_numbers_").first().val(value.number)
          $("#modal-number-container #phones_extensions_").first().val(value.extension)
          $("#modal-number-container #phones_type_ids_").first().val(value.type_id);
        });
      }
    } );
  }
)

$(function() {
  $(document).on('click', '#clear-customer', function(event){
    $("#customer-form #customer_exists_customer_id").val("0")
    $("#customer-form #customer_search").val("")
    $("#customer-form #customer_first_name").val("");
    $("#customer-form #customer_last_name").val("");
    $("#customer-form #customer_email").val("");
    $("#customer-form #address_address_1").val("");
    $("#customer-form #address_address_2").val("");
    $("#customer-form #address_zip_code").val("");
    $("#customer-form #address_city").val("");
    $("#customer-form #address_county").val("");
    $("#customer-form #address_state_id").val(0);
    $("#customer-name").val("")
    $("#editing-customer").addClass("hidden")
    $(".added-number").remove();
  })
})
