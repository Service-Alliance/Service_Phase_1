$(function() {
  // FIXME: refactor
  $('.referral-type').on('change', 'input[type=radio]', function() {
    $.getJSON('/referral_types/' + $(this).val() + '.json', function(data) {
      // Associated Record
      $('#referral_associated_record').find('select').empty();
      if(data.associated_record_collection && data.associated_record_collection.length > 0) {
        var select = $('#referral_associated_record').find('select');
        $('#referral_associated_record').removeClass('hidden');
        select.append('<option value="">-- ' + data.associated_record_type + ' --</option>');
        $.each(data.associated_record_collection, function() {
          select.append('<option value="' + this.id + '">' + this.name + '</option>');
        });
        $('#referral_associated_record').find('label').text(data.associated_record_type);
        $('#referral_associated_record').find('.associated-record-type').val(data.associated_record_type);
      }
      else {
        $('#referral_associated_record').find('.associated-record-type').val('');
        $('#referral_associated_record').addClass('hidden');
      }
      // Sub Types
      $('#referral_sub_type').find('select').empty();
      if(data.sub_types.length > 0) {
        var select = $('#referral_sub_type').find('select');
        $('#referral_sub_type').removeClass('hidden');
        select.append('<option value="">-- Sub Type --</option>');
        $.each(data.sub_types, function() {
          select.append('<option value="' + this.id + '">' + this.name + '</option>');
        });
      }
      else {
        $('#referral_sub_type').addClass('hidden');
      }
    });
  });
});
