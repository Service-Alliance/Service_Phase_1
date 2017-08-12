var ready;
ready = function() {
  $(document).on('change', '#call_id', function(event){
    event.preventDefault();
    var id = $("#call_id").val();

    $.ajax({
      method: "POST",
      url: '/calls/precall-lookup',
      data: {'id': id},
      dataType: 'json'
    })
    .success(function(response){

    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
