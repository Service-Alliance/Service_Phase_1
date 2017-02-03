$(function() {
    // $("#loss_loss_cause_id").parent().hide();
    var lossCauses = $("#loss_loss_cause_id").html();
    if ($("#loss_loss_cause_id").val() == ""){
        $("#loss_loss_cause_id").empty();
    }
    $('input[type=radio][name=loss\\[loss_type_id\\]]').change(function() {
        var $input = $('input[type=radio][name=loss\\[loss_type_id\\]]:checked');
        var lossType = $('label[for=' + $input.attr('id') + ']').text();
        var escaped_lossTypes = lossType.replace(/([ #/.?*+^$[\]\\(){}|-])/g, "\\$1");
        var options = $(lossCauses).filter("optgroup[label=" + escaped_lossTypes + "]").html();
        if (options) {
            $("#loss_loss_cause_id").html(options);
        } else {
            $("#loss_loss_cause_id").empty();
        }
    });
});
