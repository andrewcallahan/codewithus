class AddColumnToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :role, :string
  end
end
