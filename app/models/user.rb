class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
    :remember_me, :first_name, :last_name, :phone_number,
    :introduction, :desired_job_situation, :desired_job_location,
    :skills, :avatar, :preferred_language, :username
  # attr_accessible :title, :body

  validates_presence_of :username
  validates_uniqueness_of :username

  has_one :address
  has_many :projects
  has_many :links, :as => :owner
  has_attached_file :avatar, :styles => { :medium => "200x200>", :small => "150x150>", :thumb => "100x100>" }, :default_url => "http://pickaface.net/avatar/ppic.jpg"
  delegate :street_address, :city, :state, :postal_code, :country,
            :to => :address,
            :allow_nil => true

  def display_address
#    binding.pry
    city.to_s +
      (state.present? ? (", " + address.state_name) : "") +
      (country.present? ? (", " + address.country_name) : "")
  end

  def User.language_options
    return [
      "English",
      "Chinese"
    ]
  end

  def preferred_language_abbreviation
    return self.preferred_language.to_s.slice(0,2).downcase.to_sym
  end

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

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
