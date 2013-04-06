class Hackathon < ActiveRecord::Base
  attr_accessible :capacity, :description, :end, :image, :image_content_type, :image_file_name, :location, :name, :price, :start

  has_many :participants
  has_many :users, :through => :participants

  has_many :hackathon_creators
  has_many :creators, class_name: "User", :through => :hackathon_creators, foreign_key: "creator_id"
end
