$(function() {
    var lossCauses = $(".loss-cause").html();
    if ($(".loss-cause").val() == ""){
        $(".loss-cause").empty();
    }
    $('input.loss-type[type=radio]').change(function() {
        var $input = $('input[type=radio][name=loss\\[loss_type_id\\]]:checked');
        var lossType = $(this).parent().text();
        var escaped_lossTypes = lossType.replace(/([ #/.?*+^$[\]\\(){}|-])/g, "\\$1");
        var options = $(lossCauses).filter("optgroup[label=" + escaped_lossTypes + "]").html();
        if (options) {
            $(".loss-cause").html(options);
        } else {
            $(".loss-cause").empty();
        }
    });
});
