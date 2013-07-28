class Link < ActiveRecord::Base
  attr_accessible :description, :owner, :url_type, :url_text
  belongs_to :owner, :polymorphic => true
end
