class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street_address, :postal_code, :country

  belongs_to :user

  def state_name
    if country.present? && state.present?
      Country.search(country).states[state]["name"]
    else
      ''
    end
  end

  def country_name
    if country.present?
      Country.search(country).data["name"]
    else
      ''
    end
  end
end
