class Project < ActiveRecord::Base
  attr_accessible :description, :title

  belongs_to :user
  has_many :links, :as => :owner
end
