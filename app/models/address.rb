class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street_address, :postal_code, :country

  belongs_to :user

  def state_name
    if country.present? && state.present?
      a_country = Country.search(country)
      if ( a_country.alpha3 == "CAN" || a_country.alpha3 == "USA" )
        state
      else
        a_country.states[state]["name"]
      end
    else
      ''
    end
  end

  def country_name
    if country.present?
      a_country = Country.search(country)
      if ( a_country.alpha3 == "CAN" || a_country.alpha3 == "USA" )
        a_country.alpha3
      else
        a_country.name
      end
    else
      ''
    end
  end
end
