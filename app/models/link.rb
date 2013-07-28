class Link < ActiveRecord::Base
  attr_accessible :description, :owner, :url_type, :url_text
  belongs_to :owner, :polymorphic => true

  def self.url_types
    return [
      "My Home Page",
      "Blog",
      "Professional Networking",
      "Social Networking",
      "Code Repository",
      "Twitter Handle",
      "Email",
      "Other"
    ]
  end
end
