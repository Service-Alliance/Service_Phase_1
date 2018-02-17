var pricings = (function($) {
  var _taxEdited = false;

  var init = function() {
    $(document).ready(function() {
      if($('#pricing_form').length > 0){
        if($('#pricing_tax_amount').val() !== '0.0') {
          _taxEdited = true;
        }
        addChangeHandlers();
      }
    });
  }

  var addChangeHandlers = function() {
    $('#pricing_tax_amount').on('change', updateTaxAmount);
    $('#pricing_non_taxable_amount, #pricing_taxable_amount, #pricing_tax_amount, #pricing_tax_rate').on('change', updateTotals);
  }

  var updateTaxAmount = function() {
    _taxEdited = true;
  }

  var updateTotals = function() {
    var nonTaxable = $('#pricing_non_taxable_amount').val()-0;
    var taxable = $('#pricing_taxable_amount').val()-0;
    var subtotal = nonTaxable + taxable;
    $('#pricing_subtotal').val(subtotal);
    if(!_taxEdited || this.id === 'pricing_tax_rate') {
      var taxRate = ($('#pricing_tax_rate').val()-0);
      taxRate /= 100;
      $('#pricing_tax_amount').val((taxRate * taxable).toFixed(2));
    }
    var taxAmount = $('#pricing_tax_amount').val()-0;
    var total = subtotal + taxAmount;
    $('#pricing_total').val(total);
  }

  return {
    init: init
  }
})(jQuery);

pricings.init();
