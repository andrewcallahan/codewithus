class Hackathon < ActiveRecord::Base
  attr_accessible :capacity, :description, :end, :image, :image_content_type, :image_file_name, :location, :name, :price, :start
end
