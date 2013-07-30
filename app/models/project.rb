class Project < ActiveRecord::Base
  attr_accessible :description, :title, :attach

  belongs_to :user
  has_many :links, :as => :owner
  has_attached_file :attach, :default_url => "http://pickaface.net/avatar/ppic.jpg"

  validates_presence_of :title

  def ordered_links
    return self.links.sort_by { |link| link.url_type}
  end
end
