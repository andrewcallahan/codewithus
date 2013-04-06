class CreateHackathonCreators < ActiveRecord::Migration
  def change
    create_table :hackathon_creators do |t|
      t.integer :user_id
      t.integer :hackathon_id

      t.timestamps
    end
  end
end
