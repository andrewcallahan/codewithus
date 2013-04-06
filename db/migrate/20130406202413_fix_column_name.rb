class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :hackathon_creators, :user_id, :creator_id
  end
end
