$(function() {
    $(document).on('click', '#modal-add-number', function(event) {

        event.preventDefault();
        addNumber(this);
    });
});

function addNumber(that) {
    var numberContainer = $("#modal-number-container");
    var newNumber = $("#modal-new-number")

    cloned = newNumber.clone();

    numberContainer.append(cloned);

    newNumber.children().find('input').each(function() {
        $(this).val('');
    });

}



$(function() {
    $(document).on('click', '#modal-remove-number', function(event) {

        event.preventDefault();
        removeNumber(this);
    });
});

function removeNumber(that) {
  $(that).parent().parent().remove();
}
