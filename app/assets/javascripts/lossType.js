var ready;
ready = function() {

    // $("#loss_loss_cause_id").parent().hide();
    var lossCauses = $("#loss_loss_cause_id").html();
    console.log(lossCauses);
    // $("#loss_loss_cause_id").empty();
    $(document).on('change', '#loss_loss_type_id', function(event) {
        var lossType = $("#loss_loss_type_id :selected").text();
        var escaped_lossTypes = lossType.replace(/([ #/.?*+^$[\]\\(){}|-])/g, "\\$1");
        var options  = $(lossCauses).filter("optgroup[label=" + escaped_lossTypes + "]").html();
        if (options) {
          $("#loss_loss_cause_id").html(options);
        }
        else {
          $("#loss_loss_cause_id").empty();
        }
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);
