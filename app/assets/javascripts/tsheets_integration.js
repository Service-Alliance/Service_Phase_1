var tsheets = (function($) {
  'use strict';

  var _user_id;

  var init = function() {
    $(document).ready(function() {
      if($('#tsheets_integration_container').length === 0) { return; }

      _user_id = $('#tsheets_integration_container').data('user-id');

      $('#tsheets_integration_container').on('click', '#unlink_tsheets_user', function() {
        linkTsheetsUser(_user_id, null, null, null);
      });
    });
  }

  var linkTsheetsUser = function(local_id, tsheets_user_id, tsheets_user_first_name, tsheets_user_last_name) {
    var statusIcon = $('.tsheets-user-status');
    statusIcon.addClass('loading');
    $.ajax({
      url: '/users/' + local_id + '/link_tsheets_user',
      type: 'POST',
      data: {
        '_method': 'PATCH',
        'user[tsheets_user_id]': tsheets_user_id,
        'user[tsheets_user_first_name]': tsheets_user_first_name,
        'user[tsheets_user_last_name]': tsheets_user_last_name,
      },
      success: function(response) {
        $('#tsheets_integration_container').html(response);
      }
    });
  };

  return {
    init: init
  }

})(jQuery);

tsheets.init();
