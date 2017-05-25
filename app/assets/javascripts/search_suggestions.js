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
              label: value.first_name,
              value: value
            }
          }));
        });
      },
      select: function( event, ui ) {
        event.preventDefault();
        $("#customer_customer_exists").val(1)
        $("#customer_search").val(ui.item.value.first_name)
        $("#customer_first_name").val(ui.item.value.first_name);
        $("#customer_last_name").val(ui.item.value.last_name);
        $("#customer_email").val(ui.item.value.email);
        $("#address_address_1").val(ui.item.value.address.address_1);
        $("#address_address_2").val(ui.item.value.address.address_2);
        $("#address_zip_code").val(ui.item.value.address.zip_code);
        $("#address_city").val(ui.item.value.address.city);
        $("#address_county").val(ui.item.value.address.county);
        $("#address_state_id").val(ui.item.value.address.state_id);
      }
    } );
  }
)
