var newJobCallers = (function($) {
  'use strict';

  var initialiseCallerSearch = function() {
    $( "#caller_search" ).autocomplete({
      // source: "/customer_search_suggestions",
      source: function (request, response) {
        $.getJSON("/caller_search_suggestions?term=" + request.term, function (data) {
          response($.map(data, function (value, key) {
            return {
              label: "Caller: "+ value.first_name + " " + value.last_name,
              value: value.first_name + ' ' + value.last_name,
              record: value
            }
          }));
        });
      },
      select: function( event, ui ) {
        event.preventDefault();
        var record = ui.item.record;
        $("#caller_caller_exists").val(1)
        $("#company_name").val(record.company_name);
        $("#caller_first_name").val(record.first_name);
        $("#caller_last_name").val(record.last_name);
        $("#caller_email").val(record.email);

        if(record.address !== undefined) {
          loadAddress(record.address)
        }

        $.each(ui.item.value.phones, function( index, value ) {
          loadPhone(value);
        });
      }
    } );
  }

  var initialiseCompanySearch = function() {
    $( "#company_name.autocomplete" ).autocomplete({
      // source: "/customer_search_suggestions",
      source: function (request, response) {
        $.getJSON("/companies/search_suggestions?term=" + request.term, function (data) {
          response($.map(data, function (value, key) {
            return {
              label: value.name,
              value: value.name,
              record: value
            }
          }));
        });
      },
      select: function( event, ui ) {
        event.preventDefault();
        var record = ui.item.record;
        $("#caller_caller_exists").val(1)
        $("#company_name").val(record.name);
        if(record.address !== undefined) {
          loadAddress(record.address);
        }
      }
    } );
  }

  var loadPhone = function(phone) {
    $("#add-number" ).trigger( "click" );
    $('#submit-job').prop('disabled', false);
    $("#phones_numbers_").first().val(phone.number)
    $("#phones_extensions_").first().val(phone.extension)
    $("#phones_type_ids_").first().val(phone.type_id);
  }

  var loadAddress = function(address) {
    $("#address_address_1").val(address.address_1);
    $("#address_address_2").val(address.address_2);
    $("#address_zip_code").val(address.zip_code);
    $("#address_city").val(address.city);
    $("#address_county").val(address.county);
    $("#address_state_id").val(address.state_id);
  }

  var init = function() {
    $(document).ready(function() {
      if($('#caller_search').length + $('#company_name').length === 0) {return;}

      initialiseCallerSearch();
      initialiseCompanySearch();
    });
  }

  return {
    init: init
  }
})(jQuery);

newJobCallers.init();
