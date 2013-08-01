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
    :skills, :avatar
  # attr_accessible :title, :body

  has_one :address
  has_many :projects
  has_many :links, :as => :owner
  has_attached_file :avatar, :styles => { :medium => "200x200>", :small => "150x150>", :thumb => "100x100>" }, :default_url => "http://pickaface.net/avatar/ppic.jpg"

  def full_name
    return (self.first_name.nil? ? '' : self.first_name) + ' ' +
      (self.last_name.nil? ? '' : self.last_name)
  end

  def ordered_links
    return self.links.sort_by { |link| link.url_type}
  end

  def associated_user
    return self
  end

  def random_project_title
    proj = self.random_project
    if proj.nil?
      return ''
    else
      return proj.title
    end
  end

  def random_project
    @projects = self.projects
    if @projects.empty?
      return nil
    else
      return @projects.at(Random.rand(@projects.size))
    end
  end

end
