$(function() {
    $(document).on('click', '#add-number', function(event) {

        event.preventDefault();
        addNumber(this);
    });
});

function addNumber(that) {
    var numberContainer = $("#number-container");
    var newNumber = $("#new-number")

    cloned = newNumber.clone();

    numberContainer.append(cloned);

    newNumber.children().find('input').each(function() {
        $(this).val('');
    });

}



$(function() {
    $(document).on('click', '#remove-number', function(event) {

        event.preventDefault();
        removeNumber(this);
    });
});

function removeNumber(that) {
  $(that).parent().parent().remove();
}
