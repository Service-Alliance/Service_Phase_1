$(function() {
    $(document).on('click', '#add-oncall', function(event) {
        event.preventDefault();
        addOncall(this);
    });
});

function addOncall(that) {
    var oncallContainer = $("#oncall-container");
    var newOncall = $("#new-oncall")
    var selectedValue = $("#new-oncall").find("select").val()

    cloned = newOncall.children().clone();
    $(cloned).find("select").val(selectedValue);

    oncallContainer.append(cloned);

    newOncall.children().find('input').each(function() {
        $(this).val('');
    });
}

$(function() {
    $(document).on('click', '#remove-oncall', function(event) {
        event.preventDefault();
        removeOncall(this);
    });
});

function removeOncall(that) {
    $(that).parent().remove();
}
