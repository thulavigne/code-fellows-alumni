// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
$(document).ready(function() {
  $('#address_country').change(function() {
    if ($(this).val() == '')
      {
      $('#address_state').html( $('<option>Select a country first</option>'));
      }
    else {
      $.ajax({
        type: "GET",
        url: "/remote/getStates/" + encodeURIComponent($(this).prop('value')),
        success: function(data){
          if (data.content == 'None')  //handle the case where no state related to country selected
            {
              $('#address_state').empty();
              $('#address_state').append( $('<option>No states provided for your country</option>'));
            }
          else
            {
              $('#address_state').empty();
              $('#address_state').append( $('<option>Select your ' + data.region_name + '</option>'));
              jQuery.each(data.states,function(i, v) {
                $('#address_state').append( $('<option value="'+ data.states[i][0] +'">'+data.states[i][1] +'</option>'));
              });
            }
        }
      });
    }
  });

});
