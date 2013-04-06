class User < ActiveRecord::Base
  attr_accessible :cell, :email, :image, :image_content_type, :image_file_name, :name, :password, :password_confirmation
end
