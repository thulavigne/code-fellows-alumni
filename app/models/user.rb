class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
    :remember_me, :first_name, :last_name, :phone_number,
    :introduction, :desired_job_situation, :desired_job_location,
    :skills
  # attr_accessible :title, :body

  has_one :address
  has_many :projects
  has_many :links, :as => :owner

  def full_name
    return (self.first_name.nil? ? '' : self.first_name) + ' ' +
      (self.last_name.nil? ? '' : self.last_name)
  end

  def ordered_links
    return self.links.sort_by { |link| link.url_type}
  end
end
