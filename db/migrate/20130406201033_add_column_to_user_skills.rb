class AddColumnToUserSkills < ActiveRecord::Migration
  def change
    add_column :user_skills, :level, :integer
  end
end
