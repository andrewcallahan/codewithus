class Skill < ActiveRecord::Base
  attr_accessible :name, :skillcategory_id

  has_many :user_skills
  has_many :users, :through => :user_skills

  belongs_to :skillcategory
end
