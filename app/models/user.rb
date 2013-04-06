class User < ActiveRecord::Base
  attr_accessible :cell, :email, :image, :image_content_type, :image_file_name, :name, :password, :password_confirmation

  has_many :participants
  has_many :hackathons, :through => :particpants

  has_many :hackathon_creators
  has_many :hackathons, :through => :hackathon_creators, foreign_key: "creator_id"
end
