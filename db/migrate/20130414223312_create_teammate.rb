class CreateTeammate < ActiveRecord::Migration
  def change
    create_table :teammates do |t|

      t.integer :user_id
      t.integer :team_id
      t.timestamps
    end
  end
end
