class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street_address, :zip

  belongs_to :user
end
