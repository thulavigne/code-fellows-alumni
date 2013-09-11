class Project < ActiveRecord::Base
  attr_accessible :description, :title, :image, :date_deployed

  belongs_to :user
  has_many :links, :as => :owner

  validates_presence_of :title

  mount_uploader :image, ProjectImageUploader

  def ordered_links
    return self.links.sort_by { |link| link.url_type}
  end

  def associated_user
    return self.user
  end

end
