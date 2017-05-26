$(function() {
    $(document).on('click', '#modal-add-number', function(event) {

        event.preventDefault();
        addModalNumber(this);
    });
});

function addModalNumber(that) {
    var numberContainer = $("#modal-number-container");
    var newNumber = $("#modal-new-number")

    cloned = newNumber.clone();
    cloned.addClass("added-number");

    numberContainer.append(cloned);

    newNumber.children().find('input').each(function() {
        $(this).val('');
    });

}



$(function() {
    $(document).on('click', '#modal-remove-number', function(event) {

        event.preventDefault();
        removeModalNumber(this);
    });
});

function removeModalNumber(that) {
  $(that).parent().parent().parent().parent().remove();
}
