class UserSkillcategory < ActiveRecord::Base
  attr_accessible :skillcategory_id, :user_id, "level"
  attr_accessible :skillcategory_id, :user_id

  belongs_to :user
  belongs_to :skillcategory
end
