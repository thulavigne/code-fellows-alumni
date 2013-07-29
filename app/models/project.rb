class Project < ActiveRecord::Base
  attr_accessible :description, :title

  belongs_to :user
  has_many :links, :as => :owner

  def ordered_links
    return self.links.sort_by { |link| link.url_type}
  end
end
