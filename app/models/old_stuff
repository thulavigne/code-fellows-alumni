// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
// jQuery ->
//   $(window).load ->
//     alert "window loaded"
//     if $('#address_country').val() == ''
//       $('#address_country').val('US')
//     $.ajax "/remote/getStates/" + encodeURIComponent($('#address_country').prop('value'))
//       type: "GET"
//       success: (data) ->
//         if (data.content == 'None')
//           $('#address_state').empty()
//           $('#address_state').append( $('<option>No states provided for your country</option>'))
//         else
//           state = $('#address_state').val()
//           $('#address_state').empty()
//           $('#address_state').append( $('<option>Select your ' + data.region_name + '</option>'))
//           jQuery.each(data.states, (i, v) ->
//             $('#address_state').append( $('<option value="'+ data.states[i][0] +'">'+data.states[i][1] +'</option>'))
//           if state != ''
//             $('#address_state').val(state)
$(document).ready(function() {

  $(window).load(function() {
    if ($('#address_country').val() == '')
       $('#address_country').val('US');

    $.ajax({
        type: "GET",
        url: "/remote/getStates/" + encodeURIComponent($('#address_country').prop('value')),
        success: function(data){
          if (data.content == 'None')  //handle the case where no state related to country selected
            {
              $('#address_state').empty();
              $('#address_state').append( $('<option>No states provided for your country</option>'));
            }
          else
            {
              state = $('#address_state').val()
              $('#address_state').empty();
              $('#address_state').append( $('<option>Select your ' + data.region_name + '</option>'));
              jQuery.each(data.states,function(i, v) {
                $('#address_state').append( $('<option value="'+ data.states[i][0] +'">'+data.states[i][1] +'</option>'));
              });
              if (state != '')
                { $('#address_state').val(state) }
            }
        }
      });

  })
})
