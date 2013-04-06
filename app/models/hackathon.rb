class Hackathon < ActiveRecord::Base
  attr_accessible :capacity, :description, :end, :image, :image_content_type, :image_file_name, :location, :name, :price, :start

  has_many :participants
  has_many :users, :through => :participants

  has_attached_file :image, :default_url => "avatar.jpg"
  validates_attachment_presence :image unless :image
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

end
