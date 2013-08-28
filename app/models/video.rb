class Video < ActiveRecord::Base
  attr_accessible :description, :title, :video_link
  belongs_to :user
  validates_presence_of :title
end
