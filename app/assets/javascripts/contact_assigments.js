$(function() {
    $(document).on('click', '.add-contact', function(event) {
      event.preventDefault();
      var assignments = getUrlParameter(this);
      $("#contact_text_name").html(assignments.name)
      $("#contact_assignment_contact_id").val(assignments.id);
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
    return vars;
};
