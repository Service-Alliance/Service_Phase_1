var ready;
ready = function () {

    $(document).on('change', '#new_job_detail', function (event) {
        var selectedVal = $("#new_job_detail input[type='radio']:checked").val();
        if (selectedVal == 1 || selectedVal == 3) {
            $("#50").removeClass("hidden");
        }
        else {
            $("#50").addClass("hidden");
        }
    });


    $(document).on('change', '.edit_job_detail', function (event) {

        var selectedPay = $("input[name='job_detail[self_pay_id]']:checked").val();
        if (selectedPay == 1) {
            $(".non-self").addClass('hidden')
        } else {
            $(".non-self").removeClass('hidden')
        }
    });


    $(document).on('change', '.edit_loss', function (event) {
        var selectedVal = $("input[name='loss[visible_mold_id]']:checked").val()
        if (selectedVal == 1 || selectedVal == 3) {
            $("#mold-alert").removeClass("hidden");
        }
        else {
            $("#mold-alert").addClass("hidden");
        }
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);
