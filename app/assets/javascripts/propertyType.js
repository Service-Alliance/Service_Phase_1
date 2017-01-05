var ready;
ready = function() {
    var lossCauses = $("#property_property_type_id").html();
    $("#property_property_type_id").empty();
    $(document).on('change', '#property_structure_type_id', function(event) {
        var propertyType = $("#property_structure_type_id :selected").text();
        var escaped_propertyTypes = propertyType.replace(/([ #/.?*+^$[\]\\(){}|-])/g, "\\$1");
        var options  = $(lossCauses).filter("optgroup[label=" + escaped_propertyTypes + "]").html();
        if (options) {
          $("#property_property_type_id").html(options);
        }
        else {
          $("#property_property_type_id").empty();
        }
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);
