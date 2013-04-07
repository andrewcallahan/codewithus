class User < ActiveRecord::Base
  attr_accessible :cell, :email, :image, :image_content_type, :image_file_name, :name, :password, :password_confirmation

  has_secure_password
  validates :password, :presence => { :on => :create }

  has_many :participants
  has_many :hackathons, :through => :participants

  has_attached_file :image, :default_url => "avatar.jpg"
  validates_attachment_presence :image unless :image
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  has_many :user_skills
  has_many :skills, :through => :user_skills

  has_many :user_skillcategories
  has_many :skillcategories, :through => :user_skillcategories

  def self.from_facebook_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.identities.provider = auth.provider
      user.identities.uid = auth.uid
      user.name = auth.info.name
      user.identities.image = auth.info.image
      user.identities.atoken = auth.credentials.token
      user.identities.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password_digest = 'dbjwrqeljhgq'
      user.save
    end
  end

end
