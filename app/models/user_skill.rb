class UserSkill < ActiveRecord::Base
  attr_accessible :skill_id, :user_id, :level
end
