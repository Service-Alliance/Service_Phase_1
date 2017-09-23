var tsheets = (function($) {
  'use strict';

  var _user_id;

  var init = function() {
    $(document).ready(function() {
      if($('#tsheets_integration_container').length === 0) { return; }

      _user_id = $('#tsheets_integration_container').data('user-id');

      initializeAutocomplete();
      $('#tsheets_integration_container').on('click', '#unlink_tsheets_user', function() {
        linkTsheetsUser(_user_id, null, null, null);
      });
    });
  }

  var initializeAutocomplete = function() {
    if($('#tsheets_user').length === 0) { return; }

    $('#tsheets_user').autocomplete({
      source: '/tsheets/users.json',
      minLength: 2,
      select: function(event, ui) {
        linkTsheetsUser(_user_id, ui.item.id, ui.item.first_name, ui.item.last_name);
      }
    }).data("ui-autocomplete")._renderItem = renderTsheetsUserSuggestions;
  }

  var renderTsheetsUserSuggestions = function(ul, item) {
    var el = "<div class='tsheets-user'>" + item.first_name + ' ' + item.last_name + "</div>";
    var li = $("<li></li>")
      .data("ui-autocomplete-item", item)
      .append("<a>" + el + "</a>")
      .appendTo(ul);
    return li;
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
        initializeAutocomplete();
      }
    });
  };

  return {
    init: init
  }

})(jQuery);

tsheets.init();
