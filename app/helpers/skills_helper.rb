module SkillsHelper

  def user_skillcategory_default(user, skillcategory_id)
    user_skill_set = user.user_skillcategories
    if user_skill_set.size > 1
      user_skill = user_skill_set.find_by_skillcategory_id(skillcategory_id)
      user_skill.level
    else
      2
    end
  end

end
