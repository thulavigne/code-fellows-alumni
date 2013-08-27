class Link < ActiveRecord::Base
  attr_accessible :description, :owner, :url_type, :url_text
  belongs_to :owner, :polymorphic => true
  validates_format_of :url_text, :with => URI::regexp(%w(http https)),
    :message => "must be the full URL including http::// or https:// so that it will be clickable."
  validates_presence_of :url_text

  def self.url_types
    return [
      "My Home Page",
      "Blog",
      "Professional Networking",
      "Social Networking",
      "Code Repository",
      "Other"
    ]
  end

  def home_page?
    self.url_type == "My Home Page"
  end

end
