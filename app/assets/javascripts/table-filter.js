$(document).ready(function () {

    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('article').css('display', 'none');
        $('article[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('article').css('display', 'none').fadeIn('slow');
      }
    });

 });
