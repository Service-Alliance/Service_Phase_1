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
      select: selectFromAutocomplete
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
      select: selectFromAutocomplete
    } );
  }

  var selectFromAutocomplete = function(event, ui) {
    event.preventDefault();
    var record = ui.item.record;
    $("#caller_caller_exists").val(1)
    if(record.company_name === undefined) {
      $("#company_name").val(record.name);
    }
    else {
      $("#company_name").val(record.company_name);
    }
    updateFieldIfPresent("#caller_first_name", record.first_name);
    updateFieldIfPresent("#caller_last_name", record.last_name);
    updateFieldIfPresent("#caller_email", record.email);

    if(record.address !== undefined) {
      loadAddress(record.address)
    }

    if(record.phones !== undefined) {
      $('#number-container').empty();
      $.each(record.phones, loadPhone);
    }
  }

  var updateFieldIfPresent = function(field, value) {
    if(value !== undefined) {
      $(field).val(value);
    }
  }

  var loadPhone = function(index, phone) {
    $("#add-number" ).trigger( "click" );
    $('#submit-job').prop('disabled', false);
    $("[name='phones[numbers][]']").eq(index).val(phone.number)
    $("[name='phones[extensions][]']").eq(index).val(phone.extension)
    $("[name='phones[type_ids][]']").eq(index).val(phone.type_id)
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
