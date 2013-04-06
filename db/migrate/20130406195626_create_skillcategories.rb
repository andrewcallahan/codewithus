class CreateSkillcategories < ActiveRecord::Migration
  def change
    create_table :skillcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
