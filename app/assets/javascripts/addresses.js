var AddressForm = {
  init: function(ele) {
    this.setDefaultCountry()
    this.populateStates()
    this.handleCountryField($('#address_country'))
  },

  setDefaultCountry: function() {
    if ($('#address_country').val() == '') {
       $('#address_country').val('US')
    }
  },

  handleCountryField: function(country) {
    country.change(function() {
      if (country.val() == '') {
        $('#address_state').html( $('<option>Select a country first</option>'))
      }
      else {
        AddressForm.populateStates('')
      }
    });
  },

  populateStates: function() {
    if (!($('#address_country').val())) {
      $('#address_state').html( $('<option>Select a country first</option>'))
    }
    else {
      $.ajax({
        type: "GET",
        url: "/remote/getStates/" + encodeURIComponent($("#address_country").prop('value')),
        success: function(data){
          //handle the case where no state related to country selected
          if (data.content == 'None') {
            $('#address_state').empty();
            $('#address_state').append( $("<option value=''>No states provided for your country</option>"))
            $('label[for="address_state"]').text("State/Province/Region")
          }
          else {
            state = $('#address_state').val()
            $('#address_state').empty();
            $('#address_state').append( $('<option value=null>Select your ' + data.region_name + '</option>'))
            $('label[for="address_state"]').text(data.region_name)
            jQuery.each(data.states,function(i, v) {
              $('#address_state').append( $('<option value="'+ data.states[i][0] + '">' + data.states[i][1] + '</option>'))
            })
            if (state != '') {
              $('#address_state').val(state)
              if (!($('#address_state').val())) {
       //         alert("address state first option is " + $("#address_state option:first"))
                $("#address_state option:first").attr('selected','selected')
              }
            }
          }
        }
      })
    }
  }
}

$(document).ready(function() {
  AddressForm.init($("#address_form"))
})
