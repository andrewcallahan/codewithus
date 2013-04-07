class User < ActiveRecord::Base
  attr_accessible :cell, :email, :image, :image_content_type, :image_file_name, :name, :password, :password_confirmation

  has_secure_password
  validates :password, :presence => { :on => :create }
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
    binding.pry
    user = User.where(:uid => auth[:uid]).first_or_initialize
  end

end
