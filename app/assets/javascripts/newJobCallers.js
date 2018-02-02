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

  var initialiseCallrailIntegration = function() {
    $('#call_find_call').select2({
      ajax: {
        url: "/api/v1/datatables/calls",
        dataType: 'json',
        delay: 250,
        data: function (params) {
          return {
            search: params.term,
            sort: 'created_at',
            order: 'desc',
            limit: '10'
          };
        },
        processResults: function (data, page) {
          if(data === undefined || data.rows.undefined) { return {};}
          return { results: $.map( data.rows, function(call, i) {
            var display = call.customer_phone_number + ' - ' + call.datetime + ' - ' + call.customer_name
            return { id: call.id, text: display, raw: call }
          } ) };
        },
        cache: true
      },
      escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
      placeholder: "Search for a call (phone number or customer name)"
    }).on('select2:select', selectCall);
    $('.phone-number').on('change', loadCalls);
  }

  var selectCall = function(e) {
    if(e.params && e.params.data){
      var call = e.params.data.raw;
      var spaceIndex = call.customer_name.indexOf(' ');
      var fname = call.customer_name.slice(0, spaceIndex).trim();
      var lname = call.customer_name.slice(spaceIndex + 1, call.customer_name.length).trim();
      setFieldIfEmpty('.phone-number', call.customer_phone_number);
      setFieldIfEmpty('#address_city', call.customer_city);
      setFieldIfEmpty('#address_state_id', call.customer_state);
      setFieldIfEmpty('#caller_first_name', fname);
      setFieldIfEmpty('#caller_last_name', lname);
    }
  }

  var setFieldIfEmpty = function(field_selector, val) {
    var field = $(field_selector);
    if(field.val() === '') {
      if(field.is('select')) {
        field.find('option:contains(' + val + ')').prop("selected", true);
      }
      else {
        field.val(val);
      }
    }
  }

  var loadCalls = function(event) {
    var number = $(this).val();
    $.getJSON("/api/v1/datatables/calls", {
      search: number,
      sort: 'created_at',
      order: 'desc',
      limit: '10'
    }).then(loadCallsTable);
  }

  var loadCallsTable = function(data){

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
      initialiseCallrailIntegration();
    });
  }

  return {
    init: init
  }
})(jQuery);

newJobCallers.init();
