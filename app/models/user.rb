class User < ActiveRecord::Base
  attr_accessible :cell, :email, :image, :image_content_type, :image_file_name, :name, :password, :password_confirmation

  has_many :participants
  has_many :hackathons, :through => :participants

  has_attached_file :image, :styles => { :small => "50x50#" }, :default_url => "avatar.jpg"
  validates_attachment_presence :image unless :image
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  has_many :user_skills
  has_many :skills, :through => :user_skills

  has_many :user_skillcategories
  has_many :skillcategories, :through => :user_skillcategories
end
