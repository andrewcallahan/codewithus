class Team < ActiveRecord::Base
  attr_accessible :name, :creator_id, :hackathon_id, :project

  belongs_to :hackathon
  has_many :teammates 
  has_many :users, :through => :teammates

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  

end
