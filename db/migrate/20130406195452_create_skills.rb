class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :skillcategory_id

      t.timestamps
    end
  end
end
