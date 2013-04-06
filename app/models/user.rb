class User < ActiveRecord::Base
  attr_accessible :cell, :email, :image, :image_content_type, :image_file_name, :name, :password, :password_confirmation

  has_many :participants
  has_many :hackathons, :through => :particpants

  has_many :user_skills
  has_many :skills, :through => :user_skills

  has_many :user_skillcategories
  has_many :skillcategories, :through => :user_skillcategories
end
