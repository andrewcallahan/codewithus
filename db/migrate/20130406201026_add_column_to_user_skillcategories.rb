class AddColumnToUserSkillcategories < ActiveRecord::Migration
  def change
    add_column :user_skillcategories, :level, :integer
  end
end
