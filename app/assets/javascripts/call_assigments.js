$(function() {
    $(document).on('click', '.add-call', function(event) {
      event.preventDefault();
      var call = getUrlParameter(this);
      $("#id").val(call.call_id);
    });
});


var getUrlParameter = function getUrlParameter(that) {
    var vars = [], hash;
    var hashes = $(that).attr('href').split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    console.log(vars)
    return vars;
};
