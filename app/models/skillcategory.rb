class Skillcategory < ActiveRecord::Base
  attr_accessible :name

  has_many :user_skillcategories
  has_many :users, :through => :user_skillcategories

  has_many :skills
end
