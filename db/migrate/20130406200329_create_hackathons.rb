class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.string :location
      t.text :description
      t.integer :capacity
      t.integer :price
      t.string :image
      t.string :image_content_type
      t.string :image_file_name

      t.timestamps
    end
  end
end
