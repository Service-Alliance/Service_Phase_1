$(function() {

    $('#agent_select').on('change', function(event) {
        selectedAgent = $("#agent_select").val();
        if (selectedAgent === ""){
          $("#existing-agent").addClass('hidden');
          $("#new-agent").removeClass('hidden');
          $("#agent_agent_id").val('');
        }
        else {
          ajaxAgent(selectedAgent);
        }

    });
});


function ajaxAgent(selectedAgent){
  $.ajax({
          method: "POST",
          url: '/agents/lookup',
          data: {
              'data': selectedAgent
          },
          dataType: 'json'
      })
      .success(function(response) {
          $("#same_agent_agent_id").val(response[0].id);
          $("#new-agent").addClass('hidden');
          $("#existing-agent").removeClass('hidden');
          var first_name = response[0].first_name;
          var last_name = response[0].last_name;
          var email = response[0].email;
          var address_1 = response[1].address_1;
          var address_2 = response[1].address_2;
          var city = response[1].city;
          var zip = response[1].zip;
          var state = response[1].state_id;
          var county = response[1].county;
          $("#first_name").html(first_name);
          $("#last_name").html(last_name);
          $("#email").html(email);
          $("#address_1").html(address_1);
          $("#address_2").html(address_2);
          $("#city").html(city);
          $("#zip").html(zip);
          $("#state").html(state);
          $("#county").html(county);
      });
}
