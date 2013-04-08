class User < ActiveRecord::Base
  attr_accessible :cell, :email, :image, :image_content_type, :image_file_name, :name, :password, :password_confirmation

  has_secure_password
  # validates :password, :presence => { :on => :create }
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :participants
  has_many :hackathons, :through => :participants

  has_attached_file :image, :default_url => "avatar.jpg"
  validates_attachment_presence :image unless :image
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  has_many :user_skills
  has_many :skills, :through => :user_skills

  has_many :user_skillcategories
  has_many :skillcategories, :through => :user_skillcategories

  has_many :identities

  def self.from_facebook_omniauth(auth)
    user = User.where(:email => auth[:info][:email]).first_or_initialize
    
    # create user with default password
    user.password_digest = '$2a$10$hES1PybNlFkaGCh4ZlmlBOeRgJnnwQ3qLHuKbziZeO1/1XIpHTc5O'
    user.save

    identity = Identity.where(:uid => auth[:uid]).first_or_initialize

    # assign identity attributes
    identity.user = user
    identity.provider = auth[:provider]
    identity.uid = auth[:uid]
    identity.login_name = auth[:info][:nickname]
    identity.image = auth[:info][:image]
    identity.atoken = auth[:credentials][:token]
    identity.oauth_expires_at = Time.at(auth[:credentials][:expires_at])
    identity.save

    return user
  end

  def has_identity?
    self.identities.present?
  end

end
