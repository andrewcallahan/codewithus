class CreateUserSkillcategories < ActiveRecord::Migration
  def change
    create_table :user_skillcategories do |t|
      t.integer :user_id
      t.integer :skillcategory_id

      t.timestamps
    end
  end
end
