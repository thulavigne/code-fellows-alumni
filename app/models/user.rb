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
    :skills, :avatar, :preferred_language, :username, :twitter_handle
  # attr_accessible :title, :body

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_format_of :twitter_handle, :allow_blank => true, :with => /^@[a-zA-Z0-9]+$/,
    :message => "Must start with @ and have no spaces"

  has_one :address
  has_many :projects
  has_many :links, :as => :owner
  has_attached_file :avatar, :styles => { :medium => "200x200>", :small => "150x150>", :thumb => "100x100>" }, :default_url => "http://pickaface.net/avatar/ppic.jpg"
  delegate :street_address, :city, :state, :postal_code, :country,
            :to => :address,
            :allow_nil => true

  def self.ransackable_attributes(auth_object = nil)
    %w( email first_name last_name phone_number introduction desired_job_situation desired_job_location skills preferred_language username twitter_handle ) + _ransackers.keys
  end

  def display_address
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

  def self.search_skills(search)
    if search.present?
      strings = search.downcase.split
      self.all.select do |user|
        (strings.select {|skill| user.skills.to_s.downcase.include? skill}).count == strings.count
      end
    else
      self.all
    end
  end


  def self.search_name(search)
    strings = search.downcase.split
    search_results = Array.new
    exact_match_count = 0
    self.all.each  do |e|
      if ( e.first_name.downcase == strings.first && e.last_name.downcase == strings.last )
        search_results.insert(0,e)
        exact_match_count += 1
      end
      if ( (strings.include? e.first_name.downcase) && (strings.include? e.last_name.downcase) )
        search_results.insert(exact_match_count, e)
      end
      if ( (strings.include? e.first_name.downcase) || (strings.include? e.last_name.downcase) )
        search_results << e
      end
    end
    search_results
  end

  def relevant_link
    link = links.detect { |e| e.home_page? } || links.shuffle.first
    if link
      link.url_text
    else
      nil
    end
  end

end
